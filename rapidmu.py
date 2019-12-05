import sys
import argparse
from lxml import etree

validFormats = {
    'md':   'MD',
    'rst':  'RST',
    'MD':   'MD',
    'RST':  'RST'
}

if __name__ == '__main__':

    parser = argparse.ArgumentParser(description='Convert ODF doc format to markup format')
    parser.add_argument('-fn','--filename', help='Filename of .fodt input file to convert', required=True)
    parser.add_argument('-m','--markup', choices=['md', 'MD', 'rst', 'RST'], default='MD', help='Markup language: Markdown (default)|reStructuredText', required=False)
    args = parser.parse_args()

    # convert source file expanded styles to base styles
    xslt_doc = etree.parse("convertStyle.xsl")
    xslt_transformer = etree.XSLT(xslt_doc)
     
    source_doc = etree.parse(args.filename)
    intDoc = xslt_transformer(source_doc)
    content = etree.tostring(intDoc)

#    print (intDoc)

    # convert intermediate file to markup format

    if args.markup.lower() == 'md':
        xslt_doc = etree.parse("odf2md.xsl")
    else:
       xslt_doc = etree.parse("odf2rst.xsl")

    xslt_transformer = etree.XSLT(xslt_doc)
     
    source_doc = etree.fromstring(content)
    output_doc = xslt_transformer(source_doc)
     
    print (str(output_doc))
