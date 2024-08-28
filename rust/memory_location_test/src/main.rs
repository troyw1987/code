fn main() {
    let x: u8 = 10;
    let x_ptr: *const u8 = &x;

    let x: &str = "hi";

    println!("{x}, {:?}", x_ptr);
}
