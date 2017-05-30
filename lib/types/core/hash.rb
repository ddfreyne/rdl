rdl_nowrap :Hash

class Hash
  type_params [:k, :v], :all?
end

type :Hash, 'self.[]', '(Array<Array<u>>) -> Hash<u, u>'

type :Hash, :[], '(k) -> v'
type :Hash, :[]=, '(k, v) -> v'
type :Hash, :store, '(k,v) -> v'

# type :Hash, :assoc, '(k) -> [k, v]' # TODO
type :Hash, :assoc, '(k) -> Array<k or v>'
type :Hash, :clear, '() -> Hash<k,v>'
type :Hash, :compare_by_identity, '() -> Hash<k,v>'
type :Hash, :compare_by_identity?,  '() -> %bool'
type :Hash, :default, '(?k) -> v'
type :Hash, :default, '(k) {(k) -> v} -> v'
type :Hash, :default=, '(v) -> v'

# TODO: check on default_proc
# type :Hash, :default_proc, '() -> (Hash<k,v>,k) -> v'
# type :Hash, :default_proc=, '((Hash<k,v>,k) -> v) -> (Hash<k,v>,k) -> v'

type :Hash, :delete, '(k) -> v'
type :Hash, :delete, '(k) { (k) -> u } -> u or v'
type :Hash, :delete_if, '() { (k,v) -> %bool } -> Hash<k,v>'
type :Hash, :delete_if, '() -> Enumerator<[k, v]>'
type :Hash, :each, '() { (k,v) -> %any } -> Hash<k,v>'
type :Hash, :each, '() -> Enumerator<[k, v]>'
type :Hash, :each_pair, '() { (k,v) -> %any } -> Hash<k,v>'
type :Hash, :each_pair, '() -> Enumerator<[k, v]>'
type :Hash, :each_key, '() { (k) -> %any } -> Hash<k,v>'
type :Hash, :each_key, '() -> Enumerator<[k, v]>'
type :Hash, :each_value, '() { (v) -> %any } -> Hash<k,v>'
type :Hash, :each_value, '() -> Enumerator<[k, v]>'
type :Hash, :empty?, '() -> %bool'
type :Hash, :fetch, '(k) -> v'
type :Hash, :fetch, '(k,u) -> u or v'
type :Hash, :fetch, '(k) { (k) -> u } -> u or v'
type :Hash, :member?, '(t) -> %bool'
type :Hash, :has_key?, '(t) -> %bool'
type :Hash, :key?, '(t) -> %bool'
type :Hash, :has_value?, '(t) -> %bool'
type :Hash, :value?, '(t) -> %bool'
type :Hash, :to_s, '() -> String'
type :Hash, :inspect, '() -> String'
type :Hash, :invert, '() -> Hash<v,k>'
type :Hash, :keep_if, '() { (k,v) -> %bool } -> Hash<k,v>'
type :Hash, :keep_if, '() -> Enumerator<[k, v]>'
type :Hash, :key, '(t) -> k'
type :Hash, :keys, '() -> Array<k>'
type :Hash, :length, '() -> Fixnum'
type :Hash, :size, '() -> Fixnum'
type :Hash, :merge, '(Hash<a,b>) -> Hash<a or k, b or v>'
type :Hash, :merge, '(Hash<a,b>) { (k,v,b) -> v or b } -> Hash<a or k, b or v>'
# type :Hash, :rassoc, '(k) -> Tuple<k,v>'
type :Hash, :rassoc, '(k) -> Array<k or v>'
type :Hash, :rehash, '() -> Hash<k,v>'
type :Hash, :reject, '() -> Enumerator<[k, v]>'
type :Hash, :reject, '() {(k,v) -> %bool} -> Hash<k,v>'
type :Hash, :reject!, '() {(k,v) -> %bool} -> Hash<k,v>'
type :Hash, :select, '() {(k,v) -> %bool} -> Hash<k,v>'
type :Hash, :select!, '() {(k,v) -> %bool} -> Hash<k,v>'
# type :Hash, :shift, '() -> Tuple<k,v>'
type :Hash, :shift, '() -> Array<k or v>'
# type :Hash, :to_a, '() -> Array<Tuple<k,v>>'
type :Hash, :to_a, '() -> Array<Array<k or v>>'
type :Hash, :to_hash, '() -> Hash<k,v>'
type :Hash, :values, '() -> Array<v>'
type :Hash, :values_at, '(*k) -> Array<v>'
