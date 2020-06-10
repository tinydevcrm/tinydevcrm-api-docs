---
title: "Clients"
weight: 26
---

# Create Your Own!

I hope you've found this tutorial and documentation useful. The special thing
about TinyDevCRM is how any app built on top of it isn't special. All tiny
automation-driven apps can be built from these basic fundamentals.

__________

Say you want to build out a habit tracker in order to automate your daily
routines.

Your data model may look something like this:

Name | Frequency | Time of Day | Notes | Reminders
---------- | ---------- | ---------- | ---------- | ---------- | ----------
Eat breakfast | DAILY | MORNING | |
Brush and floss | DAILY | MORNING | Brush your teeth in the morning if you want to keep your friends | [8:00AM,]
Meditate | DAILY | MORNING | |
...
Update financial ledger | EVERY TWO WEEKS | MORNING | |
Eat lunch | DAILY | AFTERNOON | | [1:00PM,]
Check bank account | DAILY | EVENING | |
Brush and floss | DAILY | EVENING | Brush your teeth in the evening if you want to keep your teeth | [8:00PM,]
Eat dinner | DAILY | EVENING | | [6:00PM,6:30PM,]
...
Disinfect frequently touched surfaces | DAILY | ALLDAY |

You may want to send an iPhone notification, or have your Google Home say
something, when the present time matches the time of a reminder.

__________

Maybe you want to create an internal tool in order to keep track of
organizational processes your direct reports come up with in improving the
division. The more processes a report submits, the faster he or she is promoted,
with the added benefit of making everybody's lives easier and "hero work" more
visible.

Your data model may look something like this:

First Name | Last Name | Process Notes | GitHub PR | Priority Item? | Compensation | Paid?
---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ----------
Debbie | Gonzalez | `.gitattributes` for tabs/spaces | #45 | NO | $20 | NO
Jacob | Richards | linting over landing page repo | #67 | NO | $20 | NO
Michele | Wilkerson | improving test coverage to 80% | #34 | NO | $20 | NO
Nancy | Ford | no-code adaptor for marketing analytics | #12 | YES | $100 | NO

Create a view filtering for all unpaid work, and refresh that view on the 5th
day of the week (or Friday) for general awards and claps, to increase morale and
improve retention.

__________

Lastly, consider a password rotation tool, where you'd like a basic app to
remind yourself to rotate a password in your password manager every six months.

Your data model may look something like this:

Type | Name | Username | URL | Password Last Rotated
---------- | ---------- | ---------- | ---------- | ----------
Login | GitHub Login | yingw787 | https://github.com/login | 2018-07-22
Login | AWS IAM $IAM_USER Login | $IAM_USER | $ACCT.signin.aws.amazon.com | 2019-05-25
Login | Amtrak Login | scrap@yingw787.com | amtrak.com | 2007-01-02

You may want to filter all logins older than three months, and rotate those
passwords + sign out of all devices, so that any password leaks don't compromise
your account. If you have thousands of passwords, this would be impossible to do
by hand.

You could pay for solutions to all these. But managed solutions release jarring
UI/UX changes (because only shipping new product makes money), might not be
compatible with your device or devices, and become more and more expensive the
more apps you purchase. Worst of all, they might lock down your data, export
your data in its own special format, or crash and lose your data entirely. For
certain classes of these life management applications, you may want stability,
transparency, and utility, over the latest and greatest. That's why data forms
the least common denominator for all these apps, and why you might want to
separate out the data layer from the rest of your stack.
