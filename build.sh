# http://superuser.com/questions/185880/how-to-convert-a-pdf-document-to-png
renderTemplateCheetah chaos_objects.tex >| chaos_objects.cheetah.tex
mkdir tex-temp
lualatex --output-directory tex-temp --shell-escape --jobname chaos_objects chaos_objects.cheetah.tex
pdftoppm -png tex-temp/chaos_objects.pdf > chaos_objects.png


rm chaos_objects.cheetah.tex
rm -rf tex-temp
