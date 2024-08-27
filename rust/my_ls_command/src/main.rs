use std::path::PathBuf;
use std::{env, fs};

fn main() {
    let totest_path: Result<PathBuf, std::io::Error> = env::current_dir();

    let raw_path: PathBuf = totest_path.expect("yer");
    let mut out: String = String::new();

    let paths = fs::read_dir(raw_path);

    for path in paths.unwrap() {
        let raw_entry = path.unwrap().file_name();
        let entry = raw_entry.to_str().unwrap();
        out = out + entry + "\n";
    }

    println!("{out}\n");
}
