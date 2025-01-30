
library(stringr)
music.subdirs <- list.dirs("MUSIC") # vector with all subdirectories of MUSIC/
album.indices <- which(str_count(music.subdirs, pattern = "/")==2) # isolate albums
albums <- music.subdirs[album.indices] # vector with all albums
batfile <- file("batfile.txt", open = "wt")

for(i in 1:length(albums)){ # albums
  
  album.subdirs <- list.files(albums[i]) # vector with all files in album directory
  song.indices <- which(str_count(album.subdirs, pattern = ".wav")==1) # isolate the .wav files
  songs <- album.subdirs[song.indices] # vector with all songs
  code.to.process <- rep(NA, length(albums[i])) # empty vector with size equal to album size
  
  for(j in 1:length(songs)){ # songs
    
    track.file.location <- paste(albums[i],"/",songs[j], sep = "") # track file path
    track.file <- str_sub(songs[j], end = -5) # remove .wav
    track.file <- str_split(track.file, "-", simplify = T)
    track.name <- track.file[1,3]
    artist.name <- track.file[1,2]
    album.name <- str_split(albums[i], "/", simplify = T)[1,3]
 
    output.file <- paste(artist.name,"-",album.name,"-",track.name,".json", sep = "")
    code.to.process[j] <- paste("streaming_extractor_music.exe",songs[j],output.file, sep = " ")
  }
  
  writeLines(code.to.process, batfile, sep = "\n")
}

close(batfile)
