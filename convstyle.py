import sys
from lxml import etree
 
if (len(sys.argv) == 2):
    [fileName] = sys.argv[1:2]

    xslt_doc = etree.parse("convertStyle.xsl")
    xslt_transformer = etree.XSLT(xslt_doc)
     
    source_doc = etree.parse(fileName)
    output_doc = xslt_transformer(source_doc)
     
    print(str(output_doc))
else:
    print ('\nUsage: python3 convstyle.py <fileName>')
    print ('\n\tEx.: python3 convstyle.py infile.fodt > outfile.fodt\n')
    sys.exit (1)
