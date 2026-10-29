function greet
if test (count $argv) -gt 0
echo "Hello, $argv[1]!"
else
echo "Hello, world!"
end
end
for word in one two
echo $word
end
