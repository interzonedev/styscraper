package com.interzonedev.styscraper.service;

public interface ContentService {

	public String getAndCleanContent(String url, long timeoutMillis);

	public String getAndCleanContent(String url);

}
