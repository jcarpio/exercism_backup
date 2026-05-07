pub fn square(s: u32) -> u64 {
    if s == 0 || s > 64 {
        panic!("Error");
    }
    1u64 << (s - 1)
}

pub fn total() -> u64 {
    u64::MAX // 2^64 - 1 = 18_446_744_073_709_551_615
}