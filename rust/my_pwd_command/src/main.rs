use std::env;
use std::path::{Display, PathBuf};

fn main() {
    let totest_path: Result<PathBuf, std::io::Error> = env::current_dir();
    let raw_path: PathBuf = totest_path.expect("yer");

    let out: Display = raw_path.display();

    println!("{out}\n");
}

