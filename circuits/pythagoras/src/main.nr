fn main(a: Field, b:Field, c: Field) {
    assert(c*c == a*a + b*b);
}

#[test]
fn test_main() {
    main(3, 4, 5);

    // Uncomment to make test fail
    // main(1, 1);
}
