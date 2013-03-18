# Checking existence of an executable
# http://stackoverflow.com/questions/592620/check-if-a-program-exists-from-a-bash-script
command -v luatex >/dev/null 2>&1 || { echo >&2 "I require luatex (lualatex) but it's not installed.  Aborting."; exit 1; }

renderTemplateCheetah chaos_objects.tex >| chaos_objects.cheetah.tex
mkdir tex-temp
lualatex --output-directory tex-temp --shell-escape --jobname chaos_objects chaos_objects.cheetah.tex


if command -v pdftoppm >/dev/null 2>&1; then
  pdftoppm -png tex-temp/chaos_objects.pdf > chaos_objects.png;
else
  echo >&2 "";
  echo >&2 "-------------------------------------------------------------";
  echo >&2 "pdftoppm is not installed. Please generate the .png yourself.";
fi

# Cleanup
rm chaos_objects.cheetah.tex
rm -rf tex-temp
