var rev = '';
for (var i = ring.length - 1; i >= 0; rev += ring[i--]) {}

function encodeRing (x) {
    var rv = '';
    for (var i = 0; i < x.length; i++) {
        var c = x.charAt(i);
        var idx = ring.indexOf(c);
        rv += ( (idx === -1) ? c : ring.charAt(idx + 1) );
    }
    return rv;
}

function decodeRing (x) {
    var rv = '';
    for (var i = 0; i < x.length; i++) {
        var c = x.charAt(i);
        var idx = rev.indexOf(c);
        rv += ( (idx === -1) ? c : rev.charAt(idx + 1) );
    }
    return rv;
}
