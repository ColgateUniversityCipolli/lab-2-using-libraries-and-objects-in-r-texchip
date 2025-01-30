
library(stringr)
music.subdirs <- list.dirs("MUSIC") # vector with all subdirectories of MUSIC/
album.indices <- which(str_count(music.subdirs, pattern = "/")==2) # isolate albums
albums <- music.subdirs[album.indices] # vector with all albums

#for(i in 1:length(albums)){ # albums
#}
album.subdirs <- list.files(albums[1]) # vector with all files in album directory
song.indices <- which(str_count(album.subdirs, pattern = ".wav")==1) # isolate the .wav files
songs <- album.subdirs[song.indices] # vector with all songs

#for(j in 1:length(songs)){ # songs
#}

code.to.process <- rep(NA, length(albums[1])) # empty vector with size equal to album size
track.file.location <- paste(albums[1],"/",songs[1], sep = "") # track file path
track.file <- str_sub(songs[1], end = -5) # remove .wav
track.file <- str_split(track.file, "-", simplify = T)
track.name <- track.file[1,3]
artist.name <- track.file[1,2]
album.name <- str_split(albums[1], "/", simplify = T)[1,3]

output.file <- paste(artist.name,"-",album.name,"-",track.name,".json", sep = "")


