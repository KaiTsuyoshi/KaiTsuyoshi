import heapq


def get_manhattan_distance(from_state, to_state=[1, 2, 3, 4, 5, 6, 7, 0, 0]):
    distance = 0
    for i in range(len(from_state)):
        b = from_state[i]
        if b == 0:
            continue

        x = i % 3
        y = i // 3

        for j in range(len(to_state)):
            if to_state[j] == b:
                xfin = j % 3
                yfin = j // 3
                distance += (abs(xfin - x) + abs(yfin - y))

    return distance




def print_succ(state):
    
    succ_states = get_succ(state)

    for succ_state in succ_states:
        print(succ_state, "h={}".format(get_manhattan_distance(succ_state)))


def get_succ(state):
    succ_states = []

    for i in range(len(state)):
        if state[i] == 0:

            if i % 3 != 0: 
                left = state[i - 1]
            else: left = 0
                
            if left != 0:
                rshift = state.copy()
                rshift[i - 1] = 0
                rshift[i] = left
                succ_states.append(rshift)
                

            if i % 3 != 2: 
                right = state[i + 1]
            else: right = 0
            
            if right != 0:
                lshift = state.copy()
                lshift[i + 1] = 0
                lshift[i] = right
                succ_states.append(lshift)
                

            if i < 6: 
                down = state[i + 3]
            else: down = 0
            
            if down != 0:
                upshift = state.copy()
                upshift[i + 3] = 0
                upshift[i] = down
                succ_states.append(upshift)


            if i > 2: 
                up = state[i - 3]
            else: up = 0

            if up != 0:
                downshift = state.copy()
                downshift[i - 3] = 0
                downshift[i] = up
                succ_states.append(downshift)
   
    return sorted(succ_states)


def solve(state, goal_state=[1, 2, 3, 4, 5, 6, 7, 0, 0]):
   
    visitpq = []
    visitstate = []
    pq = []
    parent_index = 0
    max_queue_length = 0
    g = 0
    h = get_manhattan_distance(state)
    heapq.heappush(pq,(g + h, state, (g, h, -1)))
    final_element = None

    while pq:
        current_element = heapq.heappop(pq)
        visitpq.append(current_element)
        visitstate.append(current_element[1])
        succ_states = get_succ(current_element[1])


        if current_element[2][1] == 0:
            final_element = current_element
            break

 
        for succ_state in succ_states:
            if succ_state in visitstate:
                continue
            g = current_element[2][0] + 1
            h = get_manhattan_distance(succ_state)
            heapq.heappush(pq, (g + h, succ_state, (g, h, parent_index)))

        max_queue_length = max(max_queue_length, len(pq))

        parent_index += 1


    solution = []
    last_element = final_element
    while last_element[2][2] != -1:
        solution.append(last_element)
        next_element = visitpq[last_element[2][2]]
        last_element = next_element

    solution.append(last_element)

    state_info_list = []
    count = 0
    for move in solution[::-1]:
        state_info_list.append((move[1],move[2][1],count))
        count += 1
    
    for state_info in state_info_list:
        current_state = state_info[0]
        h = state_info[1]
        move = state_info[2]
        print(current_state, "h={}".format(h), "moves: {}".format(move))
    print("Max queue length: {}".format(max_queue_length))


if __name__ == "__main__":
    """
    Feel free to write your own test code here to exaime the correctness of your functions. 
    Note that this part will not be graded.
    """
    print_succ([2,5,1,4,0,6,7,0,3])
    print()

    print(get_manhattan_distance([2,5,1,4,0,6,7,0,3], [1, 2, 3, 4, 5, 6, 7, 0, 0]))
    print()

    solve([2,5,1,4,0,6,7,0,3])
    print()

