for f in spec/*.rb; do
  echo "Executing test: $f"
  bundle exec rspec $f
done
