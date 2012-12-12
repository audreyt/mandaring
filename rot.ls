#!/usr/bin/env lsc
require! fs
const source = \Mandarin.txt
#const source = \Cantonese.txt

c2p = {}; p2c = []
pin-p = {}
p-count = 0

for l in "#{fs.read-file-sync source}" / /\n/
  [code, pin] = l / /\s+/
  continue unless code is /^....$/ # BMP
  char = String.fromCharCode parseInt code, 16
  p = (pin-p[pin] ?= p-count++)
  c2p[char] = p
  p2c[p] ||= ""
  p2c[p] += char

ring = ''
for p, cs of p2c
  if cs.length is 1
    p2c[p] = 0
    delete c2p[cs.0]
  else
    ring += p2c[p] + p2c[p].0

#console.log ring
rev = ''
i = ring.length - 1
while i, rev += ring[i--] then void # Fast string reversal

encode = -> (* '') <| for c in it
  idx = ring.index-of c
  if idx is -1 then c else ring.char-at idx + 1

decode = -> (* '') <| for c in it
  idx = rev.index-of c
  if idx is -1 then c else rev.char-at idx + 1

#console.log encode "主席：黃委員還是堅持刪減200萬？但我們委員從原先的全刪，改為一成，後來又改為5%，現在又改為500萬，而經過本席折 衝，建議減列300萬。我再最後一次詢問各位，是否互相折衝一下，減列300萬？"
#console.log decode "嘱棤：黄娓园鍰昰奸歭剼湕200蟃？僤捰们娓园悰厡嘕的啳剼，絠煟伊承，洉俫右絠煟5%，県扗右絠煟500蟃，耏经㳀楍棤摺 蹖，徤讛湕劣300蟃。捰在栬洉伊絘询妏嗰卫，昰殕冱箱摺蹖伊吓，湕劣300蟃？"
console.log encode "林書豪真的沒有講過這句話"

