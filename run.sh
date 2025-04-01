#!/bin/sh
cargo b --release
sudo setcap cap_net_admin=eip /home/keshav/Desktop/HobbyProjects/tcpInRust/tcp_rust/target/release/tcp_rust
/home/keshav/Desktop/HobbyProjects/tcpInRust/tcp_rust/target/release/tcp_rust &
# pid is the process id of the last command
pid=$!
sudo ip addr add 192.168.0.1/24 dev tun0
sudo ip link set up dev tun0
# wait for the process to finish
wait $pid