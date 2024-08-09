module XXFS

using XXhash

root_dir = haskey(ENV,"XXFS_HOME") ? ENV["XXFS_HOME"] : "."

"""
    function xxh_hash(fname::String)

Returns the XXH-3 128-bit hash of the data inside the file named `fname`
"""
function xxh_hash(fname::AbstractString)
    open(fname) do f
        return xxh3_128(read(f))
    end
end

"""
    xxh_fname(hash::{UInt128,String})

Returns the filename that `hash` should correspond to
"""
function xxh_fname(hash::UInt128)
    xxh_fname(string(hash,base=16))
end

function xxh_fname(hash::AbstractString)
    joinpath(root_dir,hash[1:1],hash[2:2],hash[3:3],hash)
end

end # module XXFS
