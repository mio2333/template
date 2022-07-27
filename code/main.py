from tkinter import N
import torch
import argparse

def mean(x: torch.Tensor) -> torch.Tensor:
    x = torch.mean(x,dim = 1)
    return x

def process(args: argparse.Namespace) -> None:
    x = torch.randn(args.dim, args.dim)
    print(mean(x))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--dim", type=int, default=1)

    args = parser.parse_args()

    process(args)
