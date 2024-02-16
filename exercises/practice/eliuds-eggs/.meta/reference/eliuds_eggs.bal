public function eggCount(int displayValue) returns int {
    var eggs = 0;
    var current = displayValue;
    while current != 0 {
        if current % 2 == 1 {
            eggs += 1;
        }
            
        current /= 2;
    }

    return eggs;
}
