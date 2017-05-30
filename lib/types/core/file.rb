rdl_nowrap :File

type :File, 'self.absolute_path', '(String file, ?String dir) -> String abs_file'
type :File, 'self.atime', '(%path or IO file) -> Time'
type :File, 'self.basename', '(String file, ?String suffix) -> String base_name'
type :File, 'self.birthtime', '(%path or IO file) -> Time'
type :File, 'self.blockdev?', '(String or IO file) -> %bool'
type :File, 'self.chardev?', '(String or IO file) -> %bool'
type :File, 'self.chmod', '(Fixnum mode, *String files) -> Fixnum'
type :File, 'self.chown', '(Fixnum owner, Fixnum group, *String files) -> Fixnum'
type :File, 'self.ctime', '(%path or IO file) -> Time'
type :File, 'self.delete', '(*String files) -> Fixnum'
type :File, 'self.directory?', '(String or IO file) -> %bool'
type :File, 'self.dirname', '(String file) -> String dir'
type :File, 'self.executable?', '(String file) -> %bool'
type :File, 'self.executable_real?', '(String file) -> %bool'
type :File, 'self.exist?', '(%path or IO file) -> %bool'
# exists? deprecated
type :File, 'self.expand_path', '(%path file, ?%path dir) -> String abs_file'
type :File, 'self.extname', '(String path) -> String'
type :File, 'self.file?', '(String or IO file) -> %bool'
type :File, 'self.fnmatch', '(String pattern, String path, ?Fixnum flags) -> %bool'
rdl_alias :File, :fnmatch?, :fnmatch
type :File, 'self.ftype', '(String file) -> String' # TODO: return in set of strings
type :File, 'self.grpowned?', '(String or IO file) -> %bool'
type :File, 'self.identical?', '(String or IO file_1, String or IO file_2) -> %bool'
type :File, 'self.join', '(*(%path or File)) -> String'
type :File, 'self.lchmod', '(Fixnum mode, *String files) -> Fixnum'
type :File, 'self.lchown', '(Fixnum owner, Fixnum group, *String files) -> Fixnum'
type :File, 'self.link', '(String old, String new) -> 0'
type :File, 'self.lstat', '(String file) -> File::Stat'
type :File, 'self.mtime', '(%path or IO file) -> Time'
type :File, 'self.new', '(String file, ?String mode, ?String perm, ?Fixnum opt) -> File'
type :File, 'self.open', '(%path file, ?String file, ?String perm, ?Fixnum opt, mode:?String, external_encoding: ?String, internal_encoding: ?String, encoding: ?String, textmode: ?%any, binmode: ?%any, autoclose: ?%any) -> File'
type :File, 'self.open', '(%path file, ?String mode, ?String perm, ?Fixnum opt, mode:?String, external_encoding: ?String, internal_encoding: ?String, encoding: ?String, textmode: ?%any, binmode: ?%any, autoclose: ?%any) { (File) -> t } -> t'
type :File, 'self.owned?', '(String file) -> %bool'
type :File, 'self.path', '(String path) -> String'
type :File, 'self.pipe?', '(String file) -> %bool'
type :File, 'self.readable?', '(String file) -> %bool'
type :File, 'self.readable_real?', '(String file) -> %bool'
type :File, 'self.readlink', '(String link) -> String file'
type :File, 'self.readldirpath', '(String pathname, ?String dir) -> String real_pathname'
type :File, 'self.realpath', '(String pathname, ?String dir) -> String real_pathname'
type :File, 'self.rename', '(String old, String new) -> 0'
type :File, 'self.setgid?', '(String file) -> %bool'
type :File, 'self.setuid?', '(String file) -> %bool'
type :File, 'self.size', '(String or IO file) -> Fixnum'
type :File, 'self.size?', '(String or IO file) -> Fixnum or nil'
type :File, 'self.socket?', '(String or IO file) -> %bool'
type :File, 'self.split', '(String file) -> [String, String]'
type :File, 'self.stat', '(%path file) -> File::Stat'
type :File, 'self.sticky?', '(String file) -> %bool'
type :File, 'self.symlink', '(String old, String new) -> 0'
type :File, 'self.symlink?', '(String file) -> %bool'
type :File, 'self.truncate', '(String file, Fixnum) -> 0'
type :File, 'self.umask', '(?Fixnum) -> Fixnum'
rdl_alias :File, :unlink, :delete
type :File, 'self.utime', '(Time atime, Time mtime, *String files) -> Fixnum'
type :File, 'self.world_readable?', '(String or IO file) -> Fixnum or nil'
type :File, 'self.world_writable?', '(String or IO file) -> Fixnum or nil'
type :File, 'self.writable?', '(String file) -> Fixnum or nil'
type :File, 'self.writable_real?', '(String file) -> Fixnum or nil'
type :File, 'self.zero?', '(String or IO file) -> Fixnum or nil'

type :File, :atime, '() -> Time'
type :File, :birthtime, '() -> Time'
type :File, :chmod, '(Fixnum mode) -> 0'
type :File, :chown, '(Fixnum owner, Fixnum group) -> 0'
type :File, :ctime, '() -> Time'
type :File, :flock, '(Fixnum) -> 0 or %bool'
type :File, :lstat, '() -> File::Stat'
type :File, :mtime, '() -> Time'
type :File, :path, '() -> String file'
type :File, :size, '() -> Fixnum'
rdl_alias :File, :to_path, :path
type :File, :truncate, '(Fixnum) -> 0'

rdl_nowrap :'File::Stat'

type :'File::Stat', 'self.new', '(String file) -> File::Stat'
type :'File::Stat', :<=>, '(File::Stat other) -> -1 or 0 or 1 or nil'
type :'File::Stat', :atime, '() -> Time'
type :'File::Stat', :birthtime, '() -> Time'
type :'File::Stat', :blksize, '() -> Fixnum or nil'
type :'File::Stat', :blockdev?, '() -> %bool'
type :'File::Stat', :blocks, '() -> Fixnum or nil'
type :'File::Stat', :chardev?, '() -> %bool'
type :'File::Stat', :ctime, '() -> Time'
type :'File::Stat', :dev, '() -> Fixnum'
type :'File::Stat', :dev_major, '() -> Fixnum'
type :'File::Stat', :dev_minor, '() -> Fixnum'
type :'File::Stat', :directory?, '() -> %bool'
type :'File::Stat', :executable?, '() -> %bool'
type :'File::Stat', :executable_real?, '() -> %bool'
type :'File::Stat', :file?, '() -> %bool'
type :'File::Stat', :ftype, '() -> String'
type :'File::Stat', :gid, '() -> Fixnum'
type :'File::Stat', :grpowned?, '() -> %bool'
type :'File::Stat', :ino, '() -> Fixnum'
type :'File::Stat', :inspect, '() -> String'
type :'File::Stat', :mode, '() -> Fixnum'
type :'File::Stat', :mtime, '() -> Time'
type :'File::Stat', :nlink, '() -> Fixnum'
type :'File::Stat', :owned?, '() -> %bool'
type :'File::Stat', :pip?, '() -> %bool'
type :'File::Stat', :rdev, '() -> Fixnum or nil'
type :'File::Stat', :rdev_major, '() -> Fixnum'
type :'File::Stat', :rdev_minor, '() -> Fixnum'
type :'File::Stat', :readable?, '() -> %bool'
type :'File::Stat', :readable_real?, '() -> %bool'
type :'File::Stat', :setgid?, '() -> %bool'
type :'File::Stat', :setuid?, '() -> %bool'
type :'File::Stat', :size, '() -> Fixnum'
type :'File::Stat', :socket?, '() -> %bool'
type :'File::Stat', :sticky?, '() -> %bool'
type :'File::Stat', :symlink?, '() -> %bool'
type :'File::Stat', :uid, '() -> Fixnum'
type :'File::Stat', :world_readable?, '() -> Fixnum or nil'
type :'File::Stat', :world_writable?, '() -> Fixnum or nil'
type :'File::Stat', :writable?, '() -> %bool'
type :'File::Stat', :writable_real?, '() -> %bool'
type :'File::Stat', :zero?, '() -> %bool'
