import torchvision

torchvision.datasets.SVHN(".", split="train", download=True)
torchvision.datasets.SVHN(".", split="test", download=True)
torchvision.datasets.SVHN(".", split="extra", download=True)
