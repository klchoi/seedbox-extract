function extract
  set -l counts
  for zipname in $argv
    command unzip $zipname -d ~/wr
    command unzip $zipname -d ~/drive | count | read -l count
    set -a counts (math $count - 1)
  end
  for i in (seq (count $argv))
    set -l zipname $argv[$i]
    set -l count $counts[$i]
    echo Extracted (set_color yellow)$count(set_color normal) files from (set_color magenta)$zipname(set_color normal)
  end
end
