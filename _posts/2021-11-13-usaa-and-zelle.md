---
published: true  # use "false" while drafting articles just before publishing
title: USAA's phone app has a Zelle money transfer bug which accidentally discriminates against members who may be foreign or who speak or are studying a foreign language
tags: 
    - technology
    - languages
    - programming
    - computers
# date: 1999-12-31
# last_modified_at: 2000-12-31  # updates the "Updated" date at the bottom!
# permalink: /test/
# redirect_from: 
# categories: 
toc: false  # (default for Table of Contents is true)
---

# TLDR; (Summary)

1. **To use Zelle ([ZellePay](https://www.zellepay.com/)) in the USAA phone app you MUST set your phone language to `English (United States)`** (instead of, for instance, `Français (France)` like I use on my phone), or else an accidentally discriminatory bug blocks you from using Zelle under the premise of "State or foreign restrictions". 
    1. This is really silly. United States citizens living in the United States are therefore blocked from using Zelle in the USAA app just because they either prefer a foreign language or are studying it. I changed my language to French _because I studied French at the United States Defense Language Institute (DLI)_. Many other people who prefer a foreign langauge are serving in the US military or DoD (Department of Defense), or are spouses to those who do. We should _not_ be blocked from using Zelle because our phone language is non-English.
    2. Using Zelle should NOT require you to change your phone language--it shouldn't care what your phone language is. The Zelle feature and USAA app can be in English, that's fine, but it should not care what system language your phone is set to. This is a discriminatory bug.
3. See the full error message and screenshot below. 
4. This has blocked me from using Zelle **for the last 3 years of my life,** and has unfortunately probably affected many more.

To be clear:
1. I am NOT asking Zelle nor USAA to allow transactions in foreign countries. I am asking them to allow transactions _in the United States_ regardless of your phone language preferences. 
2. I am NOT asking Zelle nor USAA to translate their apps nor provide services in any other languages than English. I am simply asking them NOT to block their services when the default language of a phone is non-English. That's it!

# Details

USAA and Zelle have an absolutely infuriating bug in their software which has plagued me for years. For the past 3 years I have been completely blocked and unable to use the Zelle feature within the USAA Android phone app to send or receive money. Why? Because my phone language is French.

In order to better learn and understand French, which is a deep area of interest and study of mine, I set my phone language to French in approximately 2018. The original motivation for doing so was simply that [I wanted Google Maps to speak the street names when the navigation language was in French](https://android.stackexchange.com/questions/211747/how-can-i-make-google-maps-speak-the-street-names-when-the-voice-is-set-to-a-for/211751#211751), but due to a Google Maps limitation/bug (see the preceding link for details), it will only speak street names when the navigation language is set to the _same language as your phone's system language._ So, if I switched the navigation language to French, _it would NOT speak the street names anymore since my phone's system language was English._ The solution was to change my phone language to French, and it has helped me a ton to learn French ever since, as a sort of "mini immersion" experience. With my phone in French, Google Maps now speaks the street names in French too.

Unbeknownst to me, and as a result of making that phone system language change, I noticed the Zelle feature of the USAA app completely quit working. This was, again, about 3 years ago, and I had no idea that it was due to changing my phone's system language, since I didn't try to use Zelle again until some time later. I thought USAA was simply removing the feature, so I switched to Venmo where able, but it always bothered me that Zelle would no longer work. 

Today, however, 13 Nov. 2021, I needed to pay someone and I wanted to use Zelle. Whenever I clicked the "**SEND MONEY WITH ZELLE**" link in the USAA App, I'd see the following "Product or Service Unavailable" error message, as I have seen for three years:

<p align="center" width="100%">
    <a href="https://user-images.githubusercontent.com/6842199/141660403-c39eb3b8-2bbc-4e12-88b0-97577f79002f.jpg">
        <img width="33%" src="https://user-images.githubusercontent.com/6842199/141660403-c39eb3b8-2bbc-4e12-88b0-97577f79002f.jpg">
    </a>
</p>

The error message is:

> ### Product or Service Unavailable | USAA
>
> ### Thank You for Your Interest
> 
> This product or service is unavailable to you due to one or more of the following reasons:
>
> - Membership eligibility requirements
> - Other information drawn from your Personal Profile
> - Age requirements (must be 18 or older)
> - State or foreign restrictions
> 
> Call USAA  
> 210-531-USAA (8722)
> 
> NC-0121

I called USAA this morning and spent **2 hrs on the phone with them**. First, a banking representative checked my account to look for errors or restrictions. They said it was all clear. Then, they transferred me to a technical support representative who tried to help. The representative was good, but _when I mentioned my phone's system language was in French and I thought that might be the problem, the representative blew it off as though that could not possibly be the problem._

**Two infuriating hours total into the call** I got off the phone with no solution. 

I thought about it some more, and the fact my phone was in French kept resurfacing to my mind, especially when I noticed the **"State or foreign restrictions"** bullet again as I re-read the error again and again. So, I switched my phone language to English, and voilá! It now works perfectly!

Simply by changing my phone system language from French (`Français (France)`) to English (`English (United States)`), as shown below, Zelle now works perfectly! ie: I changed my settings FROM the left image with French as the primary language TO the right image with English as the primary language, as shown below:

<div align="center" width="100%">
    <a href="https://user-images.githubusercontent.com/6842199/141660407-440f0733-5f9c-46b3-9fcb-4cb76353044e.jpg">
        <img width="33%" src="https://user-images.githubusercontent.com/6842199/141660407-440f0733-5f9c-46b3-9fcb-4cb76353044e.jpg">
    </a>
    <a href="https://user-images.githubusercontent.com/6842199/141660406-3f20e813-b6c5-492e-b0f6-48842ceea6aa.jpg">
        <img width="33%" src="https://user-images.githubusercontent.com/6842199/141660406-3f20e813-b6c5-492e-b0f6-48842ceea6aa.jpg">
    </a>
</div>

Now, clicking the "**SEND MONEY WITH ZELLE**" link in the USAA App works as expected: 

<p align="center" width="100%">
    <a href="https://user-images.githubusercontent.com/6842199/141660405-e8ebc330-9b76-4c64-bfbd-7182ea7e8d08.jpg">
        <img width="33%" src="https://user-images.githubusercontent.com/6842199/141660405-e8ebc330-9b76-4c64-bfbd-7182ea7e8d08.jpg">
    </a>
</p>

I still want my phone in French, so I keep it in French normally, and have to annoyingly switch it back to English **just when I want to use the Zelle feature inside the USAA app.** Now if that doesn't feel like language discrimination, I don't know what does!


**In summary, that's pretty infuriating that they've accidentally been blocking me (and many others I'm sure) from using Zelle simply because my phone system language is not set to "English (United States)". That's a big bug, and I hope they fix this soon.**

I'll also add that using the Zelle app directly is also blocked by Zelle for USAA customers, as they expect you to use Zelle only from within the USAA App. If you install the Zelle app and specify your bank is USAA, it will redirect you from the Zelle app to the USAA app, preventing you from using the Zelle app directly. **So, the only known work-around to use Zelle is to change your phone language to "English (United States)" if you are a USAA customer.**

USAA and Zelle, please fix this bug. You do _not_ need to translate anything in the app to a foreign language. Just don't artificially declare me to be in a foreign _country_ is all when I'm in the United States with my phone set to a foreign _language_.


Sincerely,


Gabriel Staples,  
Senior Embedded Software Engineer, and  
Proud USAA customer since 2004
