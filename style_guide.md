# Fauna documentation style guide

This document summarizes writing guidelines that promote good Fauna documentation. It presents common rules and examples that cover modern writing best practices with the goal of ensuring consistency, accuracy, and clarity across all Fauna documentation.  

While the writing style or tone can vary depending on the subject, audience, and objective, the tone best suited for technical documentation uses a formal writing style that conveys factual information in a clear, concise manner that facilitates clear communication.

This is a living document. Style issues encountered in day-to-day authoring activities that are not covered in this document or that provide incorrect guidance should be corrected in this document.
Where this document does not provide adequate guidance, the following documents should be consulted:

- [Google Developer Documentation Style Guide](https://developers.google.com/style)
- [Microsoft Style Guide](https://docs.microsoft.com/en-us/style-guide/welcome/)

Out of consideration of local requirements, where guidance is conflicting, this document takes precedence over those guides.

This document should be used with the [Fauna AsciiDoc User Guide](./adoc_user_guide.adoc), which describes the Fauna documentation conventions for implementing the style requirements described in this document. These include the prescribed use of AsciiDoc notation and and Fauna AsciiDoc extensions.

## Common errors

The following practices is a quick checklist of some of the more common documentation issues that compromise documentation quality:

- [ ] Too many diverse concepts in the same document.
- [ ] Too many points in the same paragraph.
- [ ] Illogical or confusing structure.
- [ ] Content that does not relate to the intended audience; the primary audience is experienced database developers.
- [ ] Incorrect grammar, punctuation, spelling, or word usage.
- [ ] Pronouns other than the second-person singular: "you".
- [ ] Overuse of prepositions.
- [ ] Using a tense other than the present tense.
- [ ] Inconsistent nomenclature.
- [ ] Inconsistent use of syntax highlighting or using unsanctioned highlighting notation.
- [ ] Failure to adhere to these documentation writing guidelines.

## Author checklist

The following author's checklist should be reviewed before pushing documents to GitHub. While the CI build validation tools can catch many issues, these tasks still need to be performed to verify that the document conforms to the full style guide and Fauna documentation best practices:

- [ ] Confirm that the document fits the needs of the audience.
- [ ] Confirm that the document covers all required information about the subject matter and only that information.
- [ ] Use topic headings that are unique, clear, and descriptive of the content.
- [ ] Put the most important information first.
- [ ] Remove any content the reader doesn't need to know.
- [ ] Provide visual clues to facilitate scanning and finding information, using:

  - [ ] short paragraphs.
  - [ ] syntax highlighting.

- [ ] Check for technical completeness and accuracy.
- [ ] Check for the logical presentation of content and structure.
- [ ] Check for consistency and clarity in graphics style so that information is communicated effectively.
- [ ] Confirm correct language usage and clarity:

  - [ ] Simplify and remove needless and weasel words and phrases.
  - [ ] Ensure the document only uses second-person singular, but prefer imperative sentences.
  - [ ] Remove past and future tense words.
  - [ ] Reduce the number of prepositions.
  - [ ] Confirm that the document mostly uses active voice.

- [ ] Confirm that document metadata conforms to the style guideline.
- [ ] Run Grammarly against the topic, which is more rigorous than the CI tools grammar and spelling checker. Where they conflict, prefer the Fauna guideline.
- [ ] Confirm that a local build is error-free (`make quick`, `make checks`, `make spell`).
- [ ] Preview the topic to confirm the topic renders as expected. Preferably, test locally before pushing to GitHub.
- [ ] Ensure the topic has been reviewed by both peers and SMEs.

## General style guidelines

These style guidelines cover the most conspicuous technical writing issues that affect documentation quality. An unstated requirement is that an understanding of the fundamentals of classic English grammar be employed in your writing, whose full presentation is outside the scope of this document. 

### Plain English

Writing that is specific and unambiguous is easier to understand than writing that uses obscure or abstract terms and generalities. Sentences should be clear with simple syntax, and the text should be concise and complete. Use plain, specific, concrete words whenever possible to avoid misunderstanding. Concrete words bring images quickly to mind, whereas abstract words do not.

Short (three- and four-letter) verbs are more effective than multisyllabic verbs (e.g., "use" instead of "utilize"). Longer verbs generate more text, slow down the reader, and seldom improve the technical meaning.

Writing should be conversational but technical writing should not be too familiar or casual at the expense of meaning or comprehension. Avoid attempts at humor.

### Consistency

Maintaining consistency throughout a document facilitates the knowledge transfer from writer to reader. Words and phrases that are used repeatedly promote effective communication. Interchanging terms can confuse readers. After the definition of a term is established, continue to use it.

Follow Fauna standards regarding nomenclature and use accepted industry-standard terminology. If there is no current standard, still maintain consistency throughout the document.

Repeated writing conventions also provide a cohesive look and feel to the document. You should be consistent in heading style, verb usage, sentence structure, and organization throughout the entire document. Following the guidelines in this document inherently promotes consistency.

### Terminology

All Fauna documentation should be written using consistent terminology. When writing technical documents, avoid unfamiliar jargon, slang terms, contractions, and informal language in general. Use only industry-standard terms and accepted company terminology. The following guidelines should be applied regarding terminology:

- Use only standard company terms.
- Do not mix terms that refer to the same item.
- Establish the correct term(s) at the beginning of the document and use them consistently throughout the entire document.
- If new terms are used, the term should be explained when it is first introduced in the text and should also be included in the document Terminology section.
- Do not create new words to explain concepts. They might confuse readers.

### Positive statements

Avoid negative sentences, which tend to include the word "not" and other negations. For example:

- Change "Do not reveal your password to others" to "Keep your password hidden from others."
- Change "For resources that are not managed, the events are dropped and not processed" to "For unmanaged resources, the events are dropped without processing."

Notice that rewriting the sentence can also result in a more engaging sentence.

## Structure

The most important consideration in preparing a technical document is its content. Focus on defining a specific message and purpose for a specific audience. Be sure to provide complete information that supports the main point. Do not have multiple views and several unrelated messages in the same document. Include only supporting points that relate to the main subject in the body of the document. Present background information only as needed in order to support a position.

Ensure that the title provides an appropriate description of the document. Clearly state the subject and purpose of the document in the introduction. Also, state the audience and document scope, which will enable users to clearly understand who should read the document and a brief overview of its contents. This will also help the writer determine the appropriate material for the intended audience.

### Organization

Organization refers to the order in which information is presented. The topics, sections, and subsections should be logically structured in a clear and organized way that can provide context to orient the reader. One approach is to progress from the general to the specific. Background material should precede technical details and lead logically to a conclusion.

Individual sections should be self-contained with a clear beginning, middle, and end. Do not mix different topics within the document unless there is a clear connection between the information.

### Preview content

In a top-level document that introduces a section, usually `index.adoc`, provide a high-level overview of the section in sufficient detail so that the reader can determine if the section contains the information they're looking for.

### Monolithic and modular structure

A monolithic structure displays a blob of text without visual variation. Monolithic text is difficult to scan for information. Instead, you should present content in a modular format using headings, lists, and tables for more readable and scannable content.

The following are examples of the same content in monolithic and modular formats:

#### Monolithic example:

> *Difficult to read ...*
>
> There are four distinct numeric types: plain integers, long integers, floating-point numbers, and complex numbers. In addition, Booleans are a subtype of plain integers. Plain integers (also just called integers) are implemented using long in C, which gives them at least 32 bits of precision. Long integers have unlimited precision. Floating-point numbers are implemented using double in C. All bets on their precision are off unless you happen to know the machine you are working with.
> 
> Complex numbers have real and imaginary parts, which are each implemented using double in C. To extract these parts from a complex number z, use z.real and z.imag.
> 
> Numbers are created by numeric literals or as the result of built-in functions and operators. Unadorned integer literals (including hex and octal numbers) yield plain integers unless the value they denote is too large to be represented as a plain integer, in which case they yield a long integer. Integer literals with an "L" or "l" suffix yield long integers ("L" is preferred because "1l" looks too much like eleven!). Numeric literals containing a decimal point or an exponent sign yield floating-point numbers. Appending "j" or "J" to a numeric literal yields a complex number with a zero real part. A complex numeric literal is the sum of a real and an imaginary part.
> 
> Python fully supports mixed arithmetic: when a binary arithmetic operator has operands of different numeric types, the operand with the narrower type is widened to that of the other, where plain integer is narrower than long integer is narrower than floating-point is narrower than complex. Comparisons between numbers of mixed type use the same rule.2.6 The constructors int(), long(), float(), and complex() can be used to produce numbers of a specific type.

[[modular]]
#### Modular example:

> *Easy to scan for information ...*
>
> There are four distinct numeric types:
> 
> - plain integer
> - long integer
> - floating-point number
> - complex number
> 
> In addition, a boolean is a subtype of plain integer.
>
> The following table describes each numeric type:
>
> | Type                  | Description                                                 |
> | --------------------- | ----------------------------------------------------------- |
> | Plain integer         | Plain integers, also called integers, are implemented using long in C, which gives them at least 32 bits of precision. |
> | Long integer          | Long integers have unlimited precision. |
> | Floating-point number | Floating-point numbers are implemented using double in C. All bets on their precision are off unless you happen to know the machine you are working with. |
> | Complex number        | Complex numbers have a real and imaginary part, which are each implemented using double in C. To extract these parts from a complex number z, use z.real and z.imag. |
> 
> **Numeric representation**
> 
> Numbers are created by numeric literals or as the result of built-in functions and operators. Unadorned integer literals (including hex and octal numbers) yield plain integers unless the value they denote is too large to be represented as a plain integer, in which case they yield a long integer. Integer literals with an "L" or "l" suffix yield long integers.
> 
> Note: "L" is preferred because "1l" looks too much like eleven.
> 
> Numeric literals containing a decimal point or an exponent sign yield floating-point numbers. Appending "j" or "J" to a numeric literal yields a complex number with a zero real part. A complex numeric literal is the sum of a real and an imaginary part.
> 
> **Mixed arithmetic**
> 
> Python fully supports mixed arithmetic:
> 
> - when a binary arithmetic operator has operands of different numeric types, the operand with the narrower type is widened to that of the other
> - where plain integer is narrower than long integer is narrower than floating-point is narrower than complex. 
> 
> Comparisons between numbers of mixed type use the same rule.2.6 The constructors int(), long(), float(), and complex() can be used to produce numbers of a specific type.

### Topic-based authoring

Topics are a way of structuring information into independent, manageable chunks of information that fully encapsulate a subject. The reader should be able to understand the topic without reference to other topics. Topics should be limited to a small, digestible length to facilitate understanding and reuse in other contexts.

Topics are characterized by the following classification:

- Concept
- Reference
- Task
- Tutorial

#### Concept

Concept topics present conceptual information, which describes what something is or provides context for the subject being presented. Examples include overviews, introductions, background information, and a general description of functionality without going into detail.

The <<modular>> example is an example of a conceptual topic.

#### Reference

Reference topics typically present information in list or tabular formats. It is called a reference topic because of the unique usage pattern where the reader needs to reference detailed information that can be difficult to remember. Reference topic content is usually at the syntactic level, whereas the other types of documents tend to be at the semantic level. All reference topics across a domain should have a similar layout.

Example reference topics include API syntax descriptions and data structure descriptions.

> **Example:**
>
> POST
>
>   &nbsp;&nbsp;&nbsp;&nbsp;Execute an FQL transaction.
>
> Request
>
>   &nbsp;&nbsp;&nbsp;&nbsp;Content-Type: application/json
>
> Schema
>
>   &nbsp;&nbsp;&nbsp;&nbsp;Query
>
>   | Field name | Type | Required | Description |
>   | --| --- | --- | --- |
>   | query | String | Yes | FQL transaction to be executed. |
>   | arguments | Any | No | Provided to the submitted transaction as variables. |  

As much as possible, separate reference-type content from conceptual- and task-type content. Including non-reference content in a reference can obscure the reference content, making information hard to find.

#### Task

Task topics present procedural information that describes how to accomplish a task. The author should limit task topics to a single task and minimize the amount of background and explanation included in the topic.

Task topics are characterized by having sequential *steps* that must be performed to accomplish the task.

> **Example:**
>
> 1. Log in to the dashboard.
>
> 2. Choose **Backups** to view your databases.
>
> 3. Click the **Restore this database from previous snapshot** icon.

Cookbook recipes are task topics. A cookbook is similar to a tutorial in that both are task-oriented but cookbook recipes are related as a set of progressive tasks, where later recipes build on the knowledge gained from earlier recipes. Tutorials tend to be standalone, self-contained artifacts.

Effective cookbook recipes include these *minimalism* principles in the presentation:

- Provide hands-on, action-oriented steps for accomplishing a task. Some overview content can introduce a recipe but it should be minimal: "Show don't tell".
- Anchor the task in the user's domain.
- Include descriptions of possible errors and error recovery steps.
- Guide the reader on where to find additional information.

#### Tutorial

Tutorial topics incorporate the structure of both concept and task topics, including overview and background information and hands-on procedural steps.

### Paragraph and sentence structure

A logical, well-organized paragraph is based on breaking down information into logical groups and presenting the information in manageable pieces. Organize your ideas, making one major point with each paragraph. This creates a logical flow of information that the reader can easily follow. 

Focus the introductory paragraph on a concise overview of the immediate topic. Do not include excessive background material or concepts and artifacts that the intended audience can be assumed to already have an understanding of or that is a widely used technology.

Apply the following guidelines to writing paragraphs:

- Be sure the paragraph expresses one complete thought. Avoid mixing different concepts in the same paragraph unless there is a clear connection between the information.
- Limit most paragraphs to five or six sentences.
- Decompose paragraphs that seem overly long.
- Arrange sentences in a paragraph in a logical order to ensure that the meaning is clear on the first reading. Start generally and drill down to more detail. You might use the [inverted pyramid](https://en.wikipedia.org/wiki/Inverted_pyramid_(journalism)) as a model.
- Ensure a logical transition between paragraphs.
- Use parallel construction within a paragraph and between paragraphs.

An introductory paragraph must follow a level one (`=`) heading but must not be titled "Introduction", "Overview", or any other introductory heading title. 

These sentence style guidelines ensure clear and concise information that is easily readable:

- Use simple short, simple, and declarative sentences.
- Avoid using compound-complex sentences, breaking up long, complex sentences into several short sentences.
- Express one main thought per sentence, omitting words, phrases, or clauses that do not relate directly to the main thought of the sentence.
- Do not combine unrelated information in the same sentence.
- Arrange words in sentences so that the meaning is clear on the first reading.
- Rewrite sentences that are confusing or awkward.
- Keep sentences short. Limit sentence length to no more than 20-25 words. Typically, 10-15 word sentences are optimal.
- Limit sentence punctuation to no more than one comma.
- Avoid using semicolons, dashes, and question marks.
- Use parallel construction.
- Use concrete instead of obscure nouns.
- Avoid double negatives.
- Contractions are OK and preferred.

### Titles and headings

A heading encapsulates the subject of the topic.

- Use initial caps for the first word of titles and headings. Use lowercase for all other words in the title or heading.

  > **Incorrect**: Alert and Incident Management
  > 
  > **Correct**: Manage events and incidents

- Do not use italic or bold emphasis unless the title includes a literal, such as a method name.
- Do not include special characters or punctuation in the heading, including hyphens and question marks.

Limit nesting to four heading levels, including heading level one (`=`). The exception is when documenting naturally hierarchical topics, such as an HTTP interface, which can have an arbitrarily deep hierarchy.

Concept and reference topic titles and headings are noun clauses that state the subject of the topic. 

Start task topic titles and headings with an action verb. Preferably, use the imperative form for more engaging writing. To facilitate search, do not begin with a gerund verbal.

  > **Incorrect**:  Creating an alert
  > 
  > **Correct**: Create an alert

### Parallelism

Parallelism is a convention of heading and sentence construction whereby similar ideas are expressed in a similar way, making the related elements easier to follow. Follow these guidelines to ensure parallel construction:

- Ensure that two or more parts of speech behaving similarly in a sentence or that are connected in some way have parallel construction.
- Ensure that sentences containing related information within the same paragraph are written using parallel construction.
- Write all items in a list using parallel construction. Each item should begin with the same type of word (noun, verb, etc.). For example,

  > **Incorrect:**
  >
  > Before submitting your document for editing, complete the following tasks:
  > 
  > - Complete a peer review.
  > - Reviewers’ signatures are required.
  > - Checking for misspelled words.
  >
  > **Correct:**
  >
  > Before submitting your document for editing, complete the following tasks:
  > 
  > - Complete a peer review.
  > - Obtain the reviewers’ signature.
  > - Correct any misspelled words.

- Similarly, headings at the same level should have a parallel construction.

### Ordered lists vs. tables

Lists are an effective format for summarizing information. Tables are used to organize complex information so it can be visualized and understood more easily.

Do not use ordered lists that imply multi-column descriptions, such as definitions. For example:

  > **Incorrect:**
  >
  > - `Admin`: equivalent to using a key with the `admin-role`.
  > - `Server`: equivalent to using a key with the `server-role`.

Rewrite the example using a table, including a heading that defines the columns.

Include caption/heading in tables, using sentence-style capitalization for the table title and each column heading. Use sentence-style capitalization for the text in cells unless there's a reason not to (for example, keywords that must be lowercase).

For definitions, use the AsciiDoc glossary-type construct.

### Directional language

Avoid directional language terms related to the document, itself, such as "above" and "below". Instead, name the location in the document by title or heading. Ideally, provide a link to the location.

When documenting a GUI, name the GUI artifact, not the location of the artifact.

## Word watch

The following words and phrases are problematic because they make the writing less readable or obscure meaning.

Many but not all of these kinds of errors are detected by the documentation validation tools at build time. Unless absolutely impossible, all detected errors should be corrected before merging to `main`. Undetected errors that violate the style guide and are discovered in editing should also be corrected before merging to `main`.

Note: In rewriting content to satisfy style requirements, you'll usually discover that the content is improved by the rewording.

These lists should not be considered exhaustive.

### Word usage

These words are commonly misused. Care should be taken to review the document making sure these words are used correctly.

Word | Rationale/suggestion
--- | ---
abort | Generally, avoid. Use "end," "exit," or "stop", instead.
above | For "earlier," use "previous," preceding," or "earlier."  For "above section," use a hyperlink.
access | Do not use for "start," "create," or "open." Use see, edit, find, use, or view.
accessible | Reserve for things that people can easily use.
activate | Do not use for "open," "start," or "switch to."
affect | Affect as a verb means to have an influence on. Effect as a noun means the result or outcome.
after | Use after to emphasize that completion is necessary before proceeding. Do not use "once" to mean after.
afterwards | Replace with afterward.
allow |Use allow only to refer to features, such as security, that permit or deny some action. To describe user capabilities that a feature or product makes easy or possible, use "you can" or "lets you". Permissions are "granted," not "allowed".
allows | Use allows only to refer to features, such as security, that permit or deny some action. To describe user capabilities that a feature or product makes easy or possible, use "you can" or "lets you". Permissions are "granted," not "allowed".
alphabetic | Replace with alphabetical.
although | Use although to show contrast; the same as "even though".
among | Among refers to three or more things. Use "between" to refer to two things, regardless of the total number of items.
and/or | Avoid. Choose either "and" or "or", or rewrite the sentence.
as | Do not use as a synonym for "because" or "while" in subordinate clauses.
assure | Use insure to mean "to provide insurance," use ensure to mean "to make sure" or "to guarantee," use assure to mean "to state positively" or "to make confident".
backwards | Replace with backward.
between | Among refers to three or more things. Use "between" to refer to two things, regardless of the total number of items.
can | Use "can" to express probability. Use may to express permission. Use might to express possibility.
cancelled | Replace with canceled.
cancelling | Replace with canceling.
check | Use "select" or "clear" when referring to a checkbox or choosing from multiple items.
close | Do not use for exit a program or end a connection.
current | Avoid, because it might soon be out-of-date.
currently | Avoid, because it might soon be out-of-date.
desire | Replace with "want" or "need."
desired | Replace with "wanted" or "needed." Better yet, do not use past tense.
dialog | Use "dialog box," not "dialog."
done | Use "when you are finished" instead of "when you are done."
effect | Affect as a verb means to have an influence on. Effect as a noun means the result or outcome.
enable | Use "you can" to refer to making something possible for the user. It is OK to call a feature or function enabled.
enabled | Use "you can" to refer to making something possible for the user. It is OK to call a feature or function enabled.
enables | Use "you can" to refer to making something possible for the user. It is OK to call a feature or function enabled.
ensure | Use insure to mean "to provide insurance," use ensure to mean "to make sure" or "to guarantee," use assure to mean "to state positively" or "to make confident".
farther | Farther refers to physical distances, "further" refers to additional degree, quality, or time.
fewer | Use less to refer to a mass amount, value, or degree. Use "fewer" to refer to a countable number of items.
further | Farther refers to physical distances, "further" refers to additional degree, quality, or time.
given | Do not use to mean "specified", "particular", or "fixed".
greater | Use "later" when referring to program version.
illegal | Use "invalid" or "not valid."
initiate | Do not use to mean start a program; use "start", instead.
install | Use "Install" as a verb. Use "installation" as a noun.
installation | Use "Install" as a verb. Use "installation" as a noun.
insure | Use insure to mean "to provide insurance," use ensure to mean "to make sure" or "to guarantee," use assure to mean "to state positively" or "to make confident".
is | You might be using passive voice. Re-write for active voice.
its | Its is the possessive form; it\'s is the contraction meaning "it is".
less | Use less to refer to a mass amount, value, or degree. Use "fewer" to refer to a countable number of items.
leverage | Do not use as a verb to mean "take advantage of". Use "take advantage of", "capitalize on", or "use".
may | Use may to express permission. Generally, replace with "might" or "can".
might | Use "can" to express probability. Use may to express permission. Use might to express possibility.
must | If the action is mandatory, use "must".
net | Use "network".
new | Avoid, because it might soon be out-of-date.
normally | Implies "in a normal manner," which may not be possible for everyone. Replace with "usually", "ordinarily", "generally", or a similar term.
once | Do not use as a synonym for "after" or "when".
only | Place immediately preceding or following the word or phrase it modifies, not just before the verb.
onto | Use "on to" to log on, use "onto" for "on top of".
parameter | An argument typically is a value or expression containing data or code that is used with an operator or passed to a function. A parameter is a value given to a variable and treated as a constant until the operation is completed. Parameters are often used to customize a program for a particular purpose.
our | Do not use. Use second-person singular.
prompt | Do not use as a synonym for message.
purge | Use "delete," "clear," or "remove" instead.
quit | Use "exit" or "close" instead.
regarding | Replace with "about".
remove | Do not use "remove" to mean "delete".
sample | Sample is a graphic representation, not an exact representation. Don't use for "example".
select | Use "choose" when a decision needs to be made.
set | Avoid. Be specific about the action.
should | Avoid. If the action is mandatory, use "must".
since | Use since when referring to time. Do not use since to mean because.
so | When so introduces a clause of purpose or result, change it to "so that".
specify | Avoid. Be specific about the action.
that | That introduces a clause essential to the meaning of the sentence, defining the preceding text. Don't confuse with "which".
then | Then is not a coordinate conjunction and thus cannot correctly join two independent clauses. Avoid using then in an "if/then" construct.
therefore | Often used to restate a definition or point that was not clearly defined in the previous text.
thus | Often used to restate a definition or point that was not clearly defined in the previous text.
towards | Replace with "toward".
utilize | Use only to mean "to find a practical use for," not as a synonym for "use".
we | In general, do not use, except in the phrase "we recommend". Otherwise, use second-person singular.
when | When combines the idea of after with the immediacy of the following action. Do not use "once" to mean when.
which | Which is descriptive, but not essential to the meaning to the sentence; enclosed in commas.
while | Use to refer to something occurring in time. Avoid as a synonym for although.
wish | Replace with "want". Ex.: change "may wish" to "might want".
you | Occasional use of you can create a friendly tone but use it sparingly. Don't be too casual.
your | Use sparingly. Don't be too casual.

### Simplify

A simpler, more effective alternate word is usually a better choice for these words.

Word | Replace with
--- | ---
accomplish | Replace with do.
additional | Replace with more.
additionally | Replace with also.
alter | Replace with change.
alternatively | Replace with or.
appear | Replace with look.
appears | Replace with looks.
approximately | Replace with about.
assist | Replace with help.
attempt | Replace with try.
automatically | Delete when intent is clear.
begin | Replace with start.
beneath | Replace with under.
breakthrough | Replace with new.
complicated |Replace with complex.
concerning | Replace with about.
consult | Replace with see.
contain | Replace with have.
containing | Replace with with.
contains | Replace with has.
demonstrate | Replace with show.
determine | Replace with find.
difficult | Replace with hard.
entire | Replace with whole.
having | Replace with with.
highlights | Replace with shows or covers.
however | Replace with but.
illustrates | Replace with shows.
immediately | Replace with now or omit.
innovative | Replace with new.
locate | Replace with find.
major | Replace with main or huge.
modification | Replace with change.
modifies | Replace with changes.
modify | Replace with change.
necessary | Replace with needed or required.
obtain | Replace with get.
operate | Replace with work.
perform | Replace with do.
pertains | Replace with applies.
portion |Replace with part.
portions | Replace with parts.
primary | Replace with main.
principle | Replace with main.
receive | Replace with get.
remainder | Replace with rest.
robust | Replace with strong.
upon | Replace with on.
whenever | Replace with when.
within | Replace with in.

### Phrase

Simplify these phrases while maintaining the intended meaning.

Word | Simplified
--- | ---
and so on | Use "so".
a number of | Use "amount" to refer to things that can be measured. Use "number" to refer to things that can be counted as individual units.
as a result of | Use "of".
as well as | Use "and".
at present | Use "present".
at this point | Use "now".
a variety of | Use "various".
be sure to | Use "make sure".
by means of | Use "by".
check out | Use "see".
click on | Use "click".
for instance | Use "for example".
in order to | Use "to".
in the event of | Use "if".
is unable to | Use "can't".
lets you | Use "allows".
place the | Use "put".
right click | Use "right-click".
shows up | Use "appears".
that recommend | Use "recommends".
with respect to | Use "due to".

### Needless

These words can generally be omitted from a document without changing the meaning and their omission contributes to more engaging content:

needless | needless | needless | needless | needless | needless
--- | --- | --- | --- | --- | --- 
actually | always | any | basically | both | certain
completely | definitely | each | either | essentially | just
particular | please | quite | really | respective | respectively
simply | specific | specifically | specified | totally | very

### Language

Do not use these words and abbreviations.

Word | Replacement
--- | ---
ad hoc | Instead of "ad hoc," use more specific description
centre | Use "center".
colour | Use "color".
comprise | Avoid. Comprise is always incorrect. Use "consist", "include" or "contain".
comprises | Avoid. Comprises is always incorrect. Use "includes" or "contains".".
comprised | Avoid. Comprised of is always incorrect. Use "consisted", "included" or "contained".
dialogue | Use "dialog box," not "dialogue" or "dialog".
e.g. | Replaced with "for example".
ergo | Use "therefore".
et al | Instead of "et al," use "others".
etc. | Use "and more" instead.
fibre | Use "fiber".
i.e. | Replaced with "that is".
versa | Instead of "vice versa", use "and the reverse", or similar.
via | Implies geographic context. Avoid using as a synonym for "by," "through," or "using".
viz a vie | Use "according to".
vs | Instead of "vs.," use "versus".
whilst | Use "while".

### Tense

Keep the documentation in the present tense.

On rare occasions, it can be more natural sounding to use "will" or "was" but these should be limited as much as possible.

### Branding

Do not use the *Fauna* name unless there is an overriding reason for using it, such as the title of a release note. When referring to Fauna, use the `{server}` substitution string.

### Conjunctions

Conjunction | Usage
--- | ---
and | Avoid multiple use in a sentence.
only | Place only directly before or after the noun, subject, or verb.
either/or | Do not use.
neither/nor | Do not use.
once | Do not use. Use when or after, instead.

### Spelling

Spelling is important for clarity, comprehension, and readability. Shortcut spellings should not be used. The first spelling of a word in a dictionary is the preferred spelling.

The American spelling of words is preferred over the English spelling. For example, color instead of colour.

Documentation validation uses the `/dictionaries` directory that has a hunspell-compatible, large US English dictionary and a `fauna.dic` file with Fauna-specific terms. Do not edit the vendor US English dictionary. Add new terms to the `fauna.dic` file.

### Capitalization

Refer to the [Google Developer Style Guide](https://developers.google.com/style/capitalization) for guidance on capitalization.

### Contractions

A contraction is a word or word group that has been shortened by substituting an apostrophe for letters. Contractions give an informal tone, which is recommended.

### Anthropomorphism

Anthropomorphism attributes an action to inanimate objects, usually by adding a possessive "'s". Avoid anthropomorphism, with such examples as "Fauna's" and "server's". Instead, rewrite the sentence to use "the Fauna" and "the server".

> **Incorrect**: The ttl_days field tells Fauna when to delete the document.
>
> **Correct**: Documents are deleted ttl_days number of days after their last write.

As with most questionable constructs, rewriting the sentence in imperative form makes for a tighter, more engaging sentence:

> **Incorrect (agency):** The login screen prompts you to enter your username.
>
> **Incorrect (possessive):** Wait for the login screen's prompt to enter your username.
>
> **Correct:** Enter your user name at the prompt.

### Abbreviations and acronyms

Refer to the [Google Developer Style Guide](https://developers.google.com/style/abbreviations) for guidance on abbreviations and acronyms.

## Grammar rules

### Voice

Voice is the property of a verb that indicates the relationship between the action that the verb describes and the subject of that action. There are two forms of verbs that are referred to as voice:

- active voice
- passive voice

The following example shows the same sentence in both active and passive voice:

> **Active Voice:** A cloud network expands the system capabilities.
>
> **Passive Voice:** The system capabilities are expanded by the cloud network.

Active voice is preferred because it is more direct, simple, and clear. Passive voice de-emphasizes the performer of an action and often creates longer sentences. If it is not possible to use active voice, use passive voice sparingly.

### Tense

Tense implies the past, present, or future time of the action. It is recommended to write in simple present tense. Try to avoid all other tenses. Use past and future tenses only when it is confusing to use the present tense.

### Person

Use the second person (you, your) to refer to the user. This viewpoint focuses on the user and makes it easier to avoid passive tense. Avoid the first-person (I, we). When referring to the company or a specific department, use "Fauna recommends…." or "It is recommended" Do not use "We recommend."

In material intended for developers, use the second-person (you, your) when referring to the developer and the third-person perspective (the user) when referring to the developer's end-user.

### Modal auxiliary verbs

Make sure to correctly use modal auxiliary verbs. These include: can, could, may, might, must, shall, should, will, and would.

See [RFC2119](https://www.ietf.org/rfc/rfc2119.txt) for further guidance.

### Gerunds and participles

Don't use gerunds or verbs to transform common proper names into actions. For example, use "search," instead of "Googling."

Don't begin task topic headings or titles with a gerund. Using the verb form, instead:

> **Incorrect**: Adding an alert
>
> **Correct**: Add an alert

### Subject-verb agreement

Subject/verb agreement is a basic grammatical rule whereby the subject of a sentence should agree in number with the verb. Singular subjects should agree with singular verbs, and plural or compound subjects should agree with plural verbs. Confusion occurs when there is improper subject/verb agreement or when the subject is separated from the verb by words or phrases that do not agree in number with the subject. The following guidelines should be applied for correct subject/verb agreement:

- Singular subjects require a singular verb.
- Plural subjects require a plural verb.
- Subjects connected by the word "and" require a plural verb.
- Singular subjects connected by "either/or," "neither/nor," and "not only/but also" require a singular verb.
- When used as the subject or the modifier of the subject, the words "each," "every," "either," "neither," "one," "another," and "much" require singular verbs.
- When used as a subject or as the modifier of a subject, the words "both," "few," "several," "many," and "others" require plural verbs.
- Nouns that are plural in form but singular in meaning usually take a singular verb; e.g., physics, electronics.

### Prepositions

Sentences can usually be rewritten to avoid or reduce the number of prepositions. This makes the sentence more engaging and less wordy. If you must use a preposition, choose the right preposition for the object.

It is OK to end a sentence with a preposition.

### Pronouns

Make sure it is unambiguous which antecedent the pronoun refers to. It is better to be explicit when possible. 

> **Correct:** Set it to zero.
>
> **Better:** Set the value to zero.

### Parenthetical expressions

Avoid using parenthetical expressions, including appositives. Technical documentation is intended to be direct and concise.

### Plurals

A plural word form designates more than one of a specified thing. Generally, plurals are formed by adding "s," "es," or ‘ies" to a word. Do not use an apostrophe to form a plural word, with the exception of single letters, numbers, and signs (e.g., Mind your P's and Q's. He was born in the 50's).

Refer to the [Google Developer Style Guide](https://developers.google.com/style/plurals-parentheses) for guidance on using parentheses to indicate plurality.

## Admonitions

Use admonitions to add supplementary information or to bring attention to a subject.

There are three admonition severity levels:

Severity level | Admonition | Description
--- | --- | ---
aside | `Tip` | Supplementary information that is non-essential to understanding the subject.
informative | `Note` | (avoid) Supplementary information that appears to enhance the understanding of the subject
warning | `Warning` or `Important` | Brings to the attention of the reader to take notice and exercise caution
critical | `Caution` | (avoid) Brings to the attention of the reader to proceed with caution to avoid undesirable consequences

Admonitions other than these should not be used.

All admonitions should be used sparingly. Notes, in particular, tend to be overused. If the content is important enough to be in the document, its importance is at the same level of importance as all of the other content.

## Code examples

Do not alter code examples such that an error would occur if the reader cut-and-pasted the code example into a program. Rely on the presentation mechanism to correctly format code samples, such as scrolling to view long lines.

Assume the reader is an experienced programmer and knows the programming language. Avoid overly simplistic examples.

Combine multiple lines of code that together form a single, logical operation.

Always specify the code language for syntax highlighting. If the language is unknown or unsupported, omit the language specification.

## Command-line examples

Do not include the command line prompt in command line examples.

## Highlighting

Do no use bold or italic for emphasis. In text, emphasis is used for semantic highlighting to bring attention to an element and facilitate scanning and comprehension. If you need to emphasize something, use an admonition.

For syntax highlighting of code, command line entries, and UI artifacts, use Antora extensions or built-in, language-specific syntax highlighting directives.

Never use quotes, bold, or parentheses to set off text.

## Date and time

Refer to the [Google Developer Style Guide](https://developers.google.com/style/dates-times) for guidance on writing dates and times.

## GUI elements

### Views

Page: Refers to the main section on a display, such as the Home page.

Use open as a verb because the action opens a new UI element.

Window: Refers to an area of the page.

Dialog box: Refers to a UI element that provides an area for user interaction. Never use "dialog" alone.

Say "Display" or "Open" an element.

Use "click" for menu commands, buttons, hyperlinks, and other interface elements. Do not use "choose" to refer to actions performed on these interface elements. Use "choose" to select from a number of options.

Use "select" and "clear" for checkboxes.

### Button

Use "Click", "Select", "Navigate/Go to".

### Checkbox

Use "Click", "Select", "Clear", "Navigate/Go to".

### Heading

Identify the location on a page or window by referring to its heading title.

### Link

Use "Click", "Select", "Navigate/Go to". When referring to movement within a page, use "navigate". For moving to external destinations, use "browse".

## Figures

Figures include images (diagrams, illustrations, flowcharts), and screenshots. Do not include videos or GIFs.

Introduce the figure with a sentence about its intended purpose.

Follow the figure with a description of each of the relevant elements shown in the image.

### Images

- Omit the Fauna logo in screenshots.
- Use consistent line weights and graphic styles for all images.
- Center images on the document page.
- Do not include an image title.
- Ensure that the same image used in multiple places is the same size in all locations.
- Ensure that all text in an image is readable unless it is for illustrative purposes only.

An image callout is a label within an image that describes an image component. Image text is an explanatory text statement placed within the image. The following guidelines should be applied when using image callouts and text:

- Keep callouts and image text short.
- Use callouts and image text sparingly to avoid cluttered and confusing images.
- Ensure that callouts and image text are consistent with document text. Use the same terms in text and images.
- Use a consistent format for all callouts and text within images. Do not mix font sizes and text styles within images.
- Capitalize the first letter of all callouts and image text in an image.
- Use a period at the end of the text only if it is a complete sentence.
- Adhere to all writing guidelines for image text.

### Screenshots

General:

- Retain the breadcrumbs of the page
- Instead of using an actual IP address, use `<enter your IP address>`
- Use proper usernames
- Do not mask UI details when editing the screenshot
- Enable 508 compliance by using the Alt Text option.
- Save the screenshot in PNG or SVG format. If SVG format, it should be true SVG, not PNG-wrapped SVG.
- Give the image file a descriptive name using lowercase, separating multiple words with a dash.

Capture area:

- Do not include white spaces.  
- Do not include common sections of the screen in every screenshot.
- Do not include the Fauna logo.

Borders:

Recommended width:

(The maximum article width is 704px.)

- large: 704px
- medium: 600px
- small: 400px
- error messages and dialog boxes: 250px

## Links and cross-references

### Cross-references

In-line XREF sentence examples:

- "See TopicTitle for more information."
- "See TopicTitle for more information about blah blah blah". 

Do NOT put an xref link around the words "document", "documentation", "here", or any word other than the actual topic title. Try to use the actual topic title.

### Links

Where accuracy is essential or the full URL has significance, use the raw URL form. It is acceptable to use either the raw URL form or the domain name form, provided clarity and accuracy can be assured. 

> **Raw URL:** Learn more about (https://www.writethedocs.org/guide/docs-as-code/)[^] at ...
>
> **Domain name:** Learn more about (https://www.writethedocs.org/guide/docs-as-code/)[docs-as-code^] at ...

Always use the `^` symbol to open a new tab or window for the target.

Never use the word "here", or similar words, as a link target.

## Lists

Use an ordered list for items that have a sequential dependency, like a procedure or prioritized items. Use bullets for all other lists.

Introduce the list with a heading, a complete sentence, or a fragment that ends with a colon. Do not use a colon or period after the heading. If you introduce a list with a heading, don’t repeat the heading in introducing the list. In general, get right to the action if the heading obviously describes what the list does.

Begin each item in a list with a capital letter unless there's a reason not to. If necessary, rewrite the list item so that all items begin with capital letters or all items begin with lowercase words. 

End each list item with a period if:

- Any item forms a complete sentence when combined with the list introduction that precedes the colon. Exception: Do not use periods if all items have three or fewer words or if the items are UI labels, headings, subheadings, or strings. 
- Any item by itself is a complete sentence. Don’t use semicolons, commas, or conjunctions (like and, or or) at the end of list items.

### Unordered lists

Unordered lists are used to convey large amounts of information quickly and efficiently in a list format using minimal text. Use unordered lists to convey information that does not have to occur in a specific order, such as process steps that must be performed in sequence, in which case, use an ordered list.

The following guidelines should be applied when using unordered lists:

- Introduce or describe the listed items with a complete sentence that ends with a colon. It is acceptable, but less proper, to introduce or describe the listed items with an incomplete sentence clause.
- It is acceptable to use sentence fragments and single terms as long as the meaning is clear to the reader.
- Use a period after each listed item only if it is a complete sentence. Although less proper, there are some cases where it is also acceptable to place a period after a sentence fragment.
- Capitalize only the first letter of each listed item, unless all words are normally written in initial caps.
- Use parallel structure and begin each item with the same type of word (noun, verb, adjective, etc.).
- Do not use an unordered list for only a single item.

### Ordered lists

Use an ordered list to list steps or procedures that must occur in a specific order.

The following guidelines should be applied when using ordered lists:

- Introduce or describe the listed items with a complete sentence that ends with a colon. An introductory sentence is not needed if the ordered list is the first element following the section heading, provided the heading is descriptive of the task.
- List the items in the order that they must be performed.
- Use complete sentences for the list item.
- Use a period after each listed item.
- Capitalize only the first letter of each listed item, unless all words are usually written in initial caps.
- Use parallel structure for each item.
- Do not use numbers to list facts and information.
- Do not use an ordered list for a procedure that has a single step.
- Limit the number of steps to about seven items. If you find that more than seven steps are needed, consider restructuring the task description.
- Nested ordered lists are discouraged. As much as possible, do not use sub-steps, commonly written as steps a., b., c., etc. Instead, restructure the task description such that each series of sub-steps is a separate paragraph with an introductory sentence.

## Numbers

Refer to the [Google Developer Style Guide](https://developers.google.com/style/numbers) for guidance on writing dates and times.

Use symbols only in mathematical notation and when the symbol is commonly used in the domain being described. Do not use symbols in general writing.

## Placeholders

In general, use less than and greater than (<...>) symbols as a placeholder for variable parts. For example,

> The schema directory location is: `<path>/product/schema`.

For REST interface descriptions, use brackets ({...}) as a placeholder for variable or optional elements. For example,

    POST https://{api-url}/api/v2/tenants/{tenantId}/policies/alertCorrelation

The *api-url* and *tenantId* parts of the URI represent variables. When mentioned in supporting text, italicize the variable names as shown in the previous sentence.

## Punctuation

When a punctuation character is used in a sentence, always spell out the symbol name followed by the symbol in parentheses. For example:

> Use a dash (-) to replace whitespace in a filename.

The following describes the correct use of punctuation symbols.

### Ampersand

Use an ampersand (&), which represents the word "and," only in abbreviated terms, names of companies that use the ampersand, and in tabular material in which conservation of space is important.

### Angle brackets

A single angle bracket (>) is used to indicate the sequence of menu selections or commands (for example, File>Import>Formats).

A pair of angle brackets (< >) is used to enclose variable information.

### Apostrophe

The following guidelines should be applied when using apostrophes (') but do not apply possessive capability to inanimate objects.

- Use an apostrophe to form the possessive case of a singular noun. The letter "s" must follow the apostrophe. - Use an apostrophe to form the possessive case of a plural noun ending in the letter "s.".
- Do not use an apostrophe to form a plural word, with the exception of single letters, numbers, and signs (e.g., He had many CDs. Mind your P's and Q's. He was born in the f.).
- Use an apostrophe with indefinite pronouns.
- Use an apostrophe in hyphenated words and names of organizations and business firms only when the last word is possessive in form.
- Use an apostrophe with the words "minute," "hour," "day," "week," "month," "year," etc., when used as possessive adjectives (e.g., a minute's wait).
- Use an apostrophe in a contraction (don’t, for do not).

### Asterisk

When an alternative exists, do not use an asterisk (\*) to bold or emphasize a word or phrase. Use a semantic highlighting directive, instead.

### Backslash

The backslash (\) is generally not used, except as required by language syntactic rules for such things as escaping characters and Microsoft pathnames.

### Brackets

Use brackets ({ }) to indicate placeholder or variable information fields.

### Colon

The following guidelines should be applied when using colons (:):

- Use a colon to end a sentence or clause that introduces a list of items.
- Use a colon after a single word or term that provides a definition. However, this construct is not permitted.
- Use a colon between the hour, minute, and second when writing time.

### Comma

A comma (,) separates items in a series with a sentence. The following guidelines should be applied when using commas:

- Use a comma before the word "and" joining the last item to a series.
- Separate all listed items by commas.
- Do not use a comma before the final adjective in a series if the adjective is thought of as part of the noun.
- Do not use a comma between short independent clauses.
- Use a comma before the words "and," "but," "or," "nor," "for," "so," and "yet" when they join independent clauses.
- Use a comma after introductory elements participial phrases, a succession of introductory prepositional phrases, and introductory adverbial clauses (e.g., After configuring the system, For example, That is, etc.).
- Use a comma to set off a parenthetical expression that interrupts the sentence.
- Use a comma after the year in a date and the state in an address when either appears in the middle of a sentence.
- Numbers of five digits or more require commas (10,000). If five-digit and four-digit numbers appear together in tabular material, the four-digit numbers also require commas.
- Use a comma inside of quotation marks unless the word and comma string, together, are a literal.

### Dash and hyphen

In general, use dashes (-) or hyphens (-) sparingly to avoid long, complex sentences. The following guidelines should be applied when using hyphens:

- Use a hyphen to form compound words that modify other words (high-speed).
- Use a hyphen to connect two or more words that act together to modify another word (state-of-the-art computer).
- Use a hyphen to connect two or more words that act together to create a new meaning.
- Use a hyphen to prevent confusion or awkwardness (re-evaluate).
- Use a hyphen with prefixes before a proper noun or proper adjective.
- Use a hyphen in compound numbers and compound adjectives with numerical first parts (two-door car).
- Do not use a hyphen with most prefixes (subnetwork).
- Do not use a hyphen if one of the modifiers is an adverb ending with the letters "ly."
- Do not use a hyphen to divide a word at the end of a sentence.

### Elipse

Ellipses ( ... ) consist of three periods separated by single spaces and preceded and followed by a single space. Ellipses are used to indicate omitted material in mathematical expressions. Do not use ellipses to convey the meaning of the term "and so forth."

### Exclamation point

An exclamation point (!) is used for emphasis. Exclamation points are not used in technical writing.

### Parentheses

Parentheses ( () ) are used to enclose incidental explanatory matter that is added to a sentence but is not considered of major importance. Parentheses used in this way are not used in technical writing.

### Period

The following guidelines should be applied to using a period (.):

- Use a period to signify the end of a complete sentence.
- Use a period after an abbreviation only if it forms a word (e.g., in. for inch).
- Use a period inside of quotation marks unless the word and period are a literal combination, such as a UI element.
- Use a period after each item in an unordered list only if it is a complete sentence. Although less proper, there are some cases where it is also acceptable to place a period after a sentence fragment in an unordered list.

### Question mark

Avoid using question marks (?). Technical writing provides answers, not questions.

### Quotation mark

Do not use quotation marks (") to emphasize technical terms or expressions.

### Semicolon

Do not use a semicolon (;) to form a complex sentence. Make two sentences instead.

### Slash

Do not use a slash (/) to replace the word "per", as in "feet/second")".

### Underscore

Use an underscore (\_) to italicize or emphasize the first occurrence of a term.
