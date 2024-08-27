fn main() {
    let x: i8 = 10;
    let x_ptr: *const i8 = &x;

    let x: &str = "hi";

    println!("{x}, {:?}", x_ptr);
}
