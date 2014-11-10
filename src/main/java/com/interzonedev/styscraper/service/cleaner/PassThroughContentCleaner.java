package com.interzonedev.styscraper.service.cleaner;

import javax.inject.Named;

@Named("passThroughContentCleaner")
public class PassThroughContentCleaner implements ContentCleaner {

    @Override
    public String cleanContent(String content) {
        return content;
    }

}
