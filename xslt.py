import sys
from lxml import etree

validFormats = {
    'md':   'MD',
    'rst':  'RST',
    'MD':   'MD',
    'RST':  'RST'
}

if __name__ == '__main__':

    xformat = 'MD'
    if (len(sys.argv) == 2) or (len(sys.argv) == 3):
        [fileName] = sys.argv[1:2]
        if (len(sys.argv) == 3):
            [fmt] = sys.argv[2:3]
            try:
                xformat = validFormats[fmt]
            except KeyError:
                xformat = 'MD'
    else:
        print ('\nUsage: python3 xslt.py <fileName> [MD | RST]')
        print ('\n\tMD  = [default] Convert ODF to Markdown.')
        print ('\n\tRST = Convert ODF to reStructuredText.')
        print ('\n\tEx.: python3 xslt.py infile.fodt MD > outfile.md\n')
        sys.exit (1)

    if xformat == 'MD':
        xslt_doc = etree.parse("odf2md.xsl")
    else:
        xslt_doc = etree.parse("odf2rst.xsl")

    xslt_transformer = etree.XSLT(xslt_doc)
     
    source_doc = etree.parse(fileName)
    output_doc = xslt_transformer(source_doc)
     
    print(str(output_doc))
