import glob
import re
from PyPDF2 import PdfMerger

m = PdfMerger()
key = lambda s:[int(t) if t.isdigit() else t for t in re.split(r'(\d+)', s)]
[m.append(f) for f in sorted(glob.glob('*.pdf'), key=key)]
m.write('$out')

