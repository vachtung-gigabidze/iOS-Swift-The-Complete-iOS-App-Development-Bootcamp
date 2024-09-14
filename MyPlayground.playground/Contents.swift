var number = [1,2,3]
var result = Array(number[1...2])

for (index, element) in result.enumerated() {
    result[index] = number[index] * element
}

print(result)
