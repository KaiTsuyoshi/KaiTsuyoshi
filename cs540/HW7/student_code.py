import os
from tqdm import tqdm
import torch
import torch.nn as nn
import torch.optim as optim
import torchvision
import torchvision.transforms as transforms


class LeNet(nn.Module):
    def __init__(self, input_shape=(32, 32), num_classes=100):
        super(LeNet, self).__init__()
        self.convl1 = nn.Conv2d(in_channels = 3, out_channels = 6, kernel_size = 5,stride = 1)
        self.convl2 = nn.Conv2d(in_channels = 6, out_channels = 16, kernel_size = 5,stride = 1)
        self.flatten = nn.Flatten()
        self.lin1 = nn.Linear(400, 256)
        self.lin2 = nn.Linear(256,128)
        self.lin3 = nn.Linear(128,num_classes)
        self.input_shape = input_shape
        self.Pool = nn.MaxPool2d(kernel_size=2, stride=2)
        self.Relu = nn.ReLU()

    def forward(self, x):
        shape_dict = {}
        out = self.Pool(self.Relu(self.convl1(x)))
        shape_dict[1] = list(out.shape)

        out = self.Pool(self.Relu(self.convl2(out)))
        shape_dict[2] = list(out.shape)

        out = self.flatten(out)
        shape_dict[3] = list(out.shape)

        out = self.Relu(self.lin1(out))
        shape_dict[4] = list(out.shape)

        out = self.Relu(self.lin2(out))
        shape_dict[5] = list(out.shape)

        out = self.lin3(out)
        shape_dict[6] = list(out.shape)

        return out, shape_dict


def count_model_params():
    model = LeNet()
    model_params = 0.0
    for name, param in model.named_parameters():
        model_params += param.numel()
    return model_params / 1e6


def train_model(model, train_loader, optimizer, criterion, epoch):
    model.train()
    train_loss = 0.0
    for input, target in tqdm(train_loader, total=len(train_loader)):
        optimizer.zero_grad()
        output, _ = model(input)
        loss = criterion(output, target)
        loss.backward()
        optimizer.step()

        train_loss += loss.item()

    train_loss /= len(train_loader)
    print('[Training set] Epoch: {:d}, Average loss: {:.4f}'.format(epoch+1, train_loss))

    return train_loss


def test_model(model, test_loader, epoch):
    model.eval()
    correct = 0
    with torch.no_grad():
        for input, target in test_loader:
            output, _ = model(input)
            pred = output.max(1, keepdim=True)[1]
            correct += pred.eq(target.view_as(pred)).sum().item()

    test_acc = correct / len(test_loader.dataset)
    print('[Test set] Epoch: {:d}, Accuracy: {:.2f}%\n'.format(
        epoch+1, 100. * test_acc))

    return test_acc
