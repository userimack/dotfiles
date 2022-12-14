function ol
    set latest_dir $(ls -tr | tail -1);
    echo "cding into $latest_dir";
    cd "$latest_dir"
end
