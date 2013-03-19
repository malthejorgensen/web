# Checking existence of an executable
# http://stackoverflow.com/questions/592620/check-if-a-program-exists-from-a-bash-script
command -v luatex >/dev/null 2>&1 || { echo >&2 "I require luatex (lualatex) but it's not installed.  Aborting."; exit 1; }

# Create temporary work directory
mkdir tex-temp

renderTemplateCheetah chaos_objects.tex >| tex-temp/chaos_objects.cheetah.tex
lualatex --output-directory tex-temp --shell-escape --jobname chaos_objects tex-temp/chaos_objects.cheetah.tex

renderTemplateCheetah chaos_org_chart.tex >| tex-temp/chaos_org_chart.cheetah.tex
lualatex --output-directory tex-temp --shell-escape --jobname chaos_org_chart tex-temp/chaos_org_chart.cheetah.tex


if command -v pdftoppm >/dev/null 2>&1; then
  pdftoppm -png tex-temp/chaos_objects.pdf > chaos_objects.png;
  pdftoppm -png tex-temp/chaos_org_chart.pdf > chaos_org_chart.png;
else
  echo >&2 "";
  echo >&2 "-------------------------------------------------------------";
  echo >&2 "pdftoppm is not installed. Please generate the .png yourself.";
fi

# Cleanup
rm -rf tex-temp
