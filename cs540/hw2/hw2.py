import sys
import math


def get_parameter_vectors():
    '''
    This function parses e.txt and s.txt to get the  26-dimensional multinomial
    parameter vector (characters probabilities of English and Spanish) as
    descibed in section 1.2 of the writeup

    Returns: tuple of vectors e and s
    '''
    #Implementing vectors e,s as lists (arrays) of length 26
    #with p[0] being the probability of 'A' and so on
    e=[0]*26
    s=[0]*26

    with open('e.txt',encoding='utf-8') as f:
        for line in f:
            #strip: removes the newline character
            #split: split the string on space character
            char,prob=line.strip().split(" ")
            #ord('E') gives the ASCII (integer) value of character 'E'
            #we then subtract it from 'A' to give array index
            #This way 'A' gets index 0 and 'Z' gets index 25.
            e[ord(char)-ord('A')]=float(prob)
    f.close()

    with open('s.txt',encoding='utf-8') as f:
        for line in f:
            char,prob=line.strip().split(" ")
            s[ord(char)-ord('A')]=float(prob)
    f.close()

    return (e,s)

def shred(filename):
    X = {char: 0 for char in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'}
    with open (filename,encoding='utf-8') as f:
        for lines in f:
            for char in lines:
                char = char.upper()
                if 'A' <= char <= 'Z':
                    X[char] += 1

    return X


def main():

    e, s = get_parameter_vectors()

    X = shred('letter.txt')

    countA = X['A']
    log_e = countA * math.log(e[0])
    log_s = countA * math.log(s[0])

    print("Q1")
    for char, count in X.items():
        print(f"{char} {count}")

    print("Q2")
    print(f"{log_e:.4f}")
    print(f"{log_s:.4f}")

    f_eng = math.log(0.6) + sum(count * math.log(prob) for char, count, prob in zip(X.keys(), X.values(), e))
    f_span = math.log(0.4) + sum(count * math.log(prob) for char, count, prob in zip(X.keys(), X.values(), s))

    print("Q3")
    print(f"{f_eng:.4f}")
    print(f"{f_span:.4f}")

    diff = f_span - f_eng
    if diff >= 100:
        pr = 0
    elif diff <= -100:
        pr = 1
    else:
        pr = 1 / (1 + math.exp(diff))

    print("Q4")
    print(f"{pr:.4f}")
    
    
if __name__ == "__main__":
    main()