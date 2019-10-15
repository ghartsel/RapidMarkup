# docxform
Document source transforms - OOo authoring

## Convert Libreoffice to Markdown

1. Create .fodt source
2. Convert source styles, then transform to .md file:

    $ python3 convstyle.py <original>.fodt > conv.fodt

    $ python3 xslt.py conv.fodt MD > <original>.md

## Convert Libreoffice to reStructuredText

1. Create .fodt source
2. Convert source styles, then transform to .rst file:

    $ python3 convstyle.py <original>.fodt > conv.fodt

    $ python3 xslt.py conv.fodt RST > <original>.rst

## TODO:

    - 
