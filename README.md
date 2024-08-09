# XXFS.jl

A very simple implementation of a content addressable file system using symbolic links and xxHash.
The foundation of the system is a set of libraries in multiple languages that expect a designated
file tree ("source_tree") that contains a set of files in an arbitrary organization. This file tree
should be periodically scanned (using `xxfs.sh/xxfs_scan.sh`) to create symbolic links within a seperate
file tree ("root_tree") that contains only XX3-128 file hashes (the content addressable file system).

To find a file, simply take the XX3-128 hash of it, and then look in the `root_dir/first_char/second_char/third_char/full_hash` directory. The first/second/third character directories are there simply to make the directory access efficient (since most file systems hate directories with a ton of files).