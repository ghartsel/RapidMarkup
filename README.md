# docxform

Docxform is a Python3 technical documentation authoring tool. It lets you use LibreOffice as a WYSIWYG editor to create markup source files.

Motivation for this tool:

- The belief that ASCII-based editors and markup are inadequate for serious technical documentation (documentation is not email), and that content cannot be entirely decoupled from presentation (form does follow function).
- This mechanism permits semantic highlighting independent of the rendered format, which a strength ReStructuredText already holds over Markdown.
- Single-source documentation is supported at a high level. LibreOffice documents can be formatted for high usability and are easily published in native or PDF format for document review or publishing. Markup combined with CSS gives you the desired online presentation from the same source document.
- WYSIWYG authoring tools, when simply configured and not burdened with excessive features, is a more productive authoring environment than simple ASCII text editors. The time saved and enhanced quality of using LibreOffice far outweighs the convenience of never having to leave the keyboard.
- Under-the-hood LibreOffice is XML and XML is a natural representation for documentation, which tends to have a hierarchical structure.

## Prerequisites

- Python 3
- Free and open source LibreOffice (https://www.libreoffice.org/). Also, distributed with Ubuntu.

## Usage

``` python
    python3 xslt.py [-h] -fn FILENAME [-m {md,MD,rst,RST}]
```

Docxform currently generates ReStructuredText and Markdown (GitHub flavor) document formats. You can run the program on the sample.fodt file to convert a sample LibreOffice file and see the generated formats and supported semantic styles.

### Convert Libreoffice to Markdown

1. Create LibreOffice .fodt source
2. Convert to .md file:

Example:

``` python
    python3 xslt.py -fn sample.fodt -m MD > sample.md
```

### Convert Libreoffice to reStructuredText

1. Create LibreOffice .fodt source
2. Convert to .rst file:

Example:

``` python
    python3 xslt.py -fn sample.fodt -m RST > sample.rst
```

## Notes

If you are using a docs-as-code documentation methodology where your documentation source is version controlled like the software source, you can store, access and manage the LibreOffice .fodt-formatted files directly in the repository in the same way as any other ASCII source.

The current version of docxform supports styles defined as Custom Styles. These styles support technical software documentation semantic elements.

## TODO:

- Define additional semantic styles to support typical hardware and software documentation requirements, which might be called *specialization* in the DITA world. This involves:
    - Define a new Custom Style in LibreOffice.
    - Add the XSLT support for the new styles in the .xsl files.
- Handle unmatched elements.
- Add support for character style mapping (ex: T3).
- Add XSLT support for other markup formats, such as other Markdown flavors and wikis.
