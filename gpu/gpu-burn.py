import sys, time
import torch

p = min(100, max(0, float(sys.argv[1] if len(sys.argv) > 1 else 90))) / 100
a = torch.randn(4096, 4096, device="cuda", dtype=torch.float16)
b = torch.empty_like(a)

while True:
    t = time.perf_counter()
    while time.perf_counter() < t + 0.1 * p:
        torch.mm(a, a, out=b)
        torch.cuda.synchronize()
    time.sleep(max(0, t + 0.1 - time.perf_counter()))

