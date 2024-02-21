Final Project

The climax of this course is its final project. The final project is your opportunity to take your newfound savvy with SQL for a spin and develop your very own database. We ask that you build something of interest to you, that you solve a substantive problem, that you positively impact others, or that you change the world. Strive to create something you’re proud of.

Download the template files
Specification
Your final project should be composed of three files:

DESIGN.md, which is a rigorous design document describing your database’s purpose, scope, entities, relationships, optimizations, and limitations. The goal of the design document is to make your thinking visible. Your design document should include:
An entity relationship diagram for your database.
A video overview, no more than three minutes long.
schema.sql, which is an annotated set of CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose your database’s schema.
queries.sql, which is an annotated set of SELECT, INSERT, UPDATE, DELETE, etc. statements that users will commonly run on your database.
The requirements for each of these components are described in more detail below.

DESIGN.md
Within DESIGN.md, write about your database’s purpose, scope, entities, relationships, optimizations, and limitations. Write for a technical audience that has taken a course such as CS50 SQL. To help you, the template DESIGN.md file includes sections with questions for you to answer.

DESIGN.md is a Markdown file, which allows you to easily format your document using Markdown syntax. If you’re new to the format, learn more at markdownguide.org.

Your DESIGN.md file should include text in all sections prescribed by the template, be minimally multiple paragraphs in length, and explain why you made certain design choices. Ensure you allocate sufficient time and energy to writing a DESIGN.md that documents your project thoroughly. Be proud of it! A DESIGN.md in the neighborhood of 1000 words is likely to be sufficient for describing your project and all aspects of its functionality. If unable to reach that threshold, that probably means your project is insufficiently complex.

Entity Relationship Diagram
Your DESIGN.md file should include an entity relationship diagram for your database. You can create your entity relationship diagram any way you’d like, but allow us to suggest a few!

If you’re the pencil-and-paper type, you can draw your diagram, take a picture, and upload it to your codespace.
If you’re digitally inclined, you can use a tool such as the Mermaid.js live editor. Mermaid.js is a toolkit via which you can create and export diagrams (including entity relationship diagrams!). See the documentation to learn the relevant syntax and see examples.
You’re also welcome to use any other software that helps you draw the types of shapes you’d like to draw.
When you have an image of your entity relationship diagram, you can embed it in your DESIGN.md file using the following syntax:

![IMAGE TITLE](FILENAME)
Where IMAGE TITLE and FILENAME are your image’s title (entirely up to you!) and its filename (e.g., diagram.jpg), respectively.

Video Overview
Create a short video (that’s no more than 3 minutes in length) in which you present your project to the world, as with slides, screenshots, voiceover, and/or live action. Your video must begin with an opening section that displays:

your project’s title;
your name;
your GitHub and edX usernames;
your city and country;
and, the date you have recorded this video.
See howtogeek.com/205742/how-to-record-your-windows-mac-linux-android-or-ios-screen for tips on how to make a “screencast,” though you’re welcome to use an actual camera. Upload your video to YouTube (or, if blocked in your country, a similar site) and take note of its URL; it’s fine to flag it as “unlisted,” but don’t flag it as “private.”

schema.sql
Your schema.sql file should include a set of SQL statements to define your database’s schema, annotated with brief SQL comments. Recall that you can use the following syntax to write a SQL comment:

-- This is a SQL comment
Your schema.sql file will likely contain CREATE TABLE, CREATE INDEX, and CREATE VIEW statements.

queries.sql
Your queries.sql file should include a set of SQL queries typically run on your database, annotated with brief SQL comments.

Your queries.sql file will likely contain SELECT, INSERT, UPDATE, and DELETE statements.



This was CS50 SQL!