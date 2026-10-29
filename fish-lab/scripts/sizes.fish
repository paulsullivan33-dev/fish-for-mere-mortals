function sizes
    for f in $argv
        du -h $f
    end
end
