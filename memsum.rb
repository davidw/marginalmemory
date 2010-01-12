#!/usr/bin/ruby

require 'fileutils'

def matchexe(exe)
  pids = []
  Dir.glob("/proc/*/cmdline").each do |f|
    begin
      cmdline = File.read(f).split(/\000/)
      if cmdline[0] == exe
        pid = f.split("/")[2].to_i
        pids << pid
      end
    rescue => e
    end
  end
  return pids
end

def memory_usage(pids)
  rss = 0
  vsz = 0
  cmd = ""
  pids.each do |p|
    stat = File.read("/proc/#{p}/stat").split
    cmd = stat[1]
    vsz += stat[22].to_i
    rss += stat[23].to_i
  end
  return {:cmd => cmd, :vsz => vsz, :rss => rss}
end

#puts memory_usage(matchexe("/usr/lib/erlang/erts-5.7.2/bin/beam.smp")).inspect

#puts memory_usage(matchexe("/usr/sbin/apache2")).inspect
# puts memory_usage(matchexe("nginx")).inspect

case ARGV[0]
when "mochiweb"
  cmd = "pgrep beam.smp"
when "apache"
  cmd = "pgrep apache2"
when "nginx"
  cmd = "pgrep nginx"
when "jetty"
  cmd = "pgrep jsvc"
when "passenger"
  cmd = "pgrep -f '^(Passenger|Rails)'"
end

pids = `#{cmd}`.split
memusage = memory_usage(pids)

puts "#{memusage[:cmd]} (vsz, rss)"
puts "#{memusage[:vsz]}	#{memusage[:rss]}"
