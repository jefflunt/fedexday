**fedexday** is a project inspired by [Atlassian's FedEx Days](http://confluence.atlassian.com/display/DEV/Atlassian+FedEx+Days).

At work, we decided to do a FedEx day of our own. Within the first hour after it was announced, people were already discussing what projects they thought they might do. Several people had more than one idea, and the question came up, "Wouldn't it be great if there was a place we could go to just post ideas and get feedback, as a way to help decide which idea to implement?" This project is a very simple, stripped-down answer to that need.

**fedexday** is made up of three core concepts:
===============================================

1. **Ideas** - An idea is simply a title, and a blob of text that outlines what you're proposing to do. Keep it short and simple. These are supposed to be ideas that can be delivered in 24-hours, so you don't need to write an essay; a couple of sentences is probably enough.
2. **Endorsements** - If you're thinking, "Yeah, I like this idea, and I'd like to put my name on it as a supporter," that's what an endorsement is. You simply type your name in, and it's added as an "endorsement" on that idea, which gives the original poster some rough measure of would benefit from the idea being built.
3. **Comments** - Your run-of-the-mill anonymous comments; a place to post feedback and questions about the idea.

A couple of things to note:
===========================

1. There is no login/authentication/authorization mechanism built-in
2. Everything is free-form wiki style - anyone can edit any idea, and add/remove any endorsement, which means you can even add someone else's name to the endorsement's list.
3. Because of points `1` and `2`, it is pretty much assumed that (a) if you use this project, that you're going to host it on an internal server where only your co-workers have access, and it's not open to public viewing and/or vandalism, and (b) that your co-workers can be trusted to respect each other, and as such, the ability for anyone to edit anything is 100% okay.
4. The whole idea behind this is to have the simplest possible way to post an idea, and get feedback. So, no logins, no restrictions, and no moderator tools. Just free-form collaborative feedback, and nothing else.
5. Because your **fedexday** install is internal/on your intranet, and it's unlikely to have more than a couple hundred hits per day (and that's probably way over estimating it), the backend DB is just SQLite. The likelihood that you'll need more than this, plus a single web server instance, is so small that SQLite is more than sufficient for the job, and makes setup extremely easy. If this doesn't work for you, you're free to modify `config/database.yml` to plugin whatever database you wish.

Installation
============

1. Clone the repository
2. Install bundler, if you haven't already
3. Run `bundle install`
4. Migrate your database
5. Setup the web server of your choice

Usage notes, and auto-destroy thresholds
========================================

* Currently, comments cannot be deleted
* Endorsements can be added/deleted by anyone
* There are no "Are you sure?" confirmation dialogs, no undo, and no un-delete. If you accidentally delete an endorsement, or accidentally edit something, just change it back. No biggie. Anyone can add/edit **anything**.
* Ideas can be "scratched-out", but not deleted. "Scratching out" and idea (by clicking the "X" next to it on the index page) puts a line through the title, indicating that it's been scratched out. **Anyone** can un-scratch it, bringing the idea back to life.
* "Scratched out" ideas are automatically destroyed **if no one touches them for one whole week**, after they are scratched out - i.e. ideas that have been discarded are removed relatively quickly.
* Active (non-scratched out) ideas are automatically destroyed **if no one touches them for nine whole months** - i.e. ideas that are active, but aren't getting any attention/traction are automatically removed after nine months.

If an idea is approaching this auto-destroy threshold, we're assuming it's because no one is actively working on/discussing those ideas, so it's not a big deal if they automatically disappear. You can, of course, change these time frames by editing the code.

Happy innovating!
=================