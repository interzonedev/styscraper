package com.interzonedev.styscraper.service.cleaner;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Named;

@Named("asiaTimesContentCleaner")
public class AsiaTimesContentCleaner implements ContentCleaner {

    private final Pattern startContentPattern = Pattern.compile("<table.+id=\"Table33\"[^>]*>\\s*<tr>\\s*<td>",
            Pattern.CASE_INSENSITIVE);

    private final Pattern endContentPattern = Pattern.compile(
            "</td>\\s*</tr>\\s*</table>\\s*<br>\\s*<br>\\s*<div.+id=\"fb-root\"", Pattern.CASE_INSENSITIVE);

    private final Pattern scriptPattern = Pattern.compile("<script[^>]*>.+</script>", Pattern.CASE_INSENSITIVE
            | Pattern.DOTALL);
    private final Pattern noscriptPattern = Pattern.compile("<noscript[^>]*>.+</noscript>", Pattern.CASE_INSENSITIVE
            | Pattern.DOTALL);
    private final Pattern commentPattern = Pattern.compile("<!--.+-->", Pattern.CASE_INSENSITIVE | Pattern.DOTALL);

    @Override
    public String cleanContent(String content) {

        Matcher startContentMatcher = startContentPattern.matcher(content);
        Matcher endContentMatcher = endContentPattern.matcher(content);

        int endOfTheBeginning = -1;
        int beginningOfTheEnd = -1;

        if (startContentMatcher.find()) {
            endOfTheBeginning = startContentMatcher.end();
        }

        if (endContentMatcher.find()) {
            beginningOfTheEnd = endContentMatcher.start();
        }

        String mainContent = null;
        String cleanContent = null;

        if (beginningOfTheEnd > endOfTheBeginning) {
            mainContent = content.substring(endOfTheBeginning, beginningOfTheEnd);

            Matcher scriptMatcher = scriptPattern.matcher(mainContent);
            cleanContent = scriptMatcher.replaceAll("");

            Matcher noscriptMatcher = noscriptPattern.matcher(cleanContent);
            cleanContent = noscriptMatcher.replaceAll("");

            Matcher commentMatcher = commentPattern.matcher(cleanContent);
            cleanContent = commentMatcher.replaceAll("");

        }

        return cleanContent;

    }

}
