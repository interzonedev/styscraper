package com.interzonedev.styscraper.service;

import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

import javax.inject.Inject;
import javax.inject.Named;

import org.slf4j.LoggerFactory;

import ch.qos.logback.classic.Logger;

import com.interzonedev.httpagent.Method;
import com.interzonedev.httpagent.Request;
import com.interzonedev.httpagent.RequestService;
import com.interzonedev.httpagent.Response;

@Named("contentService")
public class ContentServiceImpl implements ContentService {

	private final Logger log = (Logger) LoggerFactory.getLogger(getClass());

	private static final long DEFAULT_TIMEOUT_MILLIS = 10000L;

	@Inject
	@Named("requestService")
	private RequestService requestService;

	@Override
	public String getAndCleanContent(String url, long timeoutMillis) {

		log.debug("getAndCleanContent: url = " + url);

		try {

			Request request = new Request(url, Method.GET, null, null);

			Future<Response> responseFuture = requestService.doRequest(request);

			log.debug("getAndCleanContent: Waiting for response");
			Response response = responseFuture.get(timeoutMillis,
					TimeUnit.MILLISECONDS);

			log.debug("getAndCleanContent: Got a response with status "
					+ response.getStatus());
			return response.getContent();

		} catch (Exception e) {

			log.error("Error making request to" + url, e);
			return null;

		}

	}

	@Override
	public String getAndCleanContent(String url) {

		return getAndCleanContent(url, DEFAULT_TIMEOUT_MILLIS);

	}

}