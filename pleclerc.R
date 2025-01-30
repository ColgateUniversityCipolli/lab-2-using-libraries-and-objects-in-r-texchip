
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
track.file.location <- paste(albums[1],"/",songs[1], sep = "")
track.file.name <- str_sub(songs[1], end = -5)
track.file.name