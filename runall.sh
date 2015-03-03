for f in spec/*.rb; do
  echo "Executing test: $f"
  bundle exec rspec $f --format documentation --format html --out "output/$f.html"
done

rm -f report.html
cat output/spec/*.html > report.html
