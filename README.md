# Pre-work - *Tip Calculator*

**Tip Calculator** is a tip calculator application for iOS.

Submitted by: **Cory Avra**

Time spent: **12** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Implemented a clean UI for simple functionality
- [x] User can change color theme to themes such as Day, Night, or Red/Green/Blue/Yellow
- [x] Total now accounts for 1-5 people

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/3MP7Rtn.gif title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

This being my first iOS app, I encoutered a few challenges. After I had familiarized myself with Xcode and finished the base version from the video tutorial, I began working on the Settings page. Designing that was fairly easy, as it was just a replication of the process for the original calculator page. However, when I began to tie in all the screen elements to their dynamic function counterparts, I received an error. Earlier, I had moved a couple of documents around and thought I had fixed their paths in the project, but apparently not. This took me a little longer than I'd like to admit to figure out, but after this was settled, the rest was smooth sailing.

First update, implemented a few new features (See features documented above). Most of the time spent implementing these was debugging with a lot of trial and error. As I'm still fairly new to Swift, I learned a lot about the synatax and nature of the language. I might update again in the next few days with some animation effects, but for now I think this might be all. 

## License

    Copyright 2015 Cory Avra

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
