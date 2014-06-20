package com.interzonedev.styscraper.web;

import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ch.qos.logback.classic.Logger;

import com.interzonedev.styscraper.service.ContentService;

@Controller
@RequestMapping(value = "/content")
public class ContentController {

    private final Logger log = (Logger) LoggerFactory.getLogger(getClass());

    @Inject
    @Named("contentService")
    private ContentService contentService;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<String> getContent(@RequestParam(value = "url", required = true) String url) {

        log.debug("getContent: Start - url = " + url);

        String content = contentService.getAndCleanContent(url);

        Map<String, Object> responseMap = new HashMap<String, Object>();
        responseMap.put("content", content);

        JSONObject jsonObject = new JSONObject(responseMap);
        String json = jsonObject.toJSONString();

        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.remove("Content-Type");
        responseHeaders.setContentType(new MediaType("application", "json", Charset.forName("utf-8")));

        ResponseEntity<String> responseEntity = new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);

        log.debug("getContent: End");

        return responseEntity;

    }

    @ExceptionHandler(Throwable.class)
    public ResponseEntity<String> handleException(Throwable t, HttpServletRequest request) {

        log.error("handleException", t);

        Map<String, Object> responseMap = new HashMap<String, Object>();
        responseMap.put("error", true);

        JSONObject jsonObject = new JSONObject(responseMap);
        String json = jsonObject.toJSONString();

        ResponseEntity<String> responseEntity = new ResponseEntity<String>(json, HttpStatus.INTERNAL_SERVER_ERROR);

        return responseEntity;

    }

}
