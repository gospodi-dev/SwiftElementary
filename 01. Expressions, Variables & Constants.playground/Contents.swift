import UIKit

// Part 1. CODE COMMENTS

// ПЕРВЫЙ СПОСОБ. Однострочный комментарий (single-line comment)

// Комментарий в одну строку
// This is a comment. It is not executed. (Это комментарий. Он не выполняется.)

// Несколько однострочных комментариев сложенных в абзац
// This is also a comment. (Это тоже комментарий)
// Over multiple lines. (На несколько строк)

// ВТОРОЙ СПОСОБ. Многострочный комментарий (multi-line comment)

/* This is also a comment.
   Over many..
   many...
   many lines. */

// Пример многострочного комментария с вложенным комментарием.
/*
 This is a comment.
 
     /* And inside it
      is
      another comment.
      */
 
 Back to the first
 */

/* Вложенные многострочные комментарии позволяют быстро и легко комментировать большие блоки кода, даже если код уже содержит многострочные комментарии. */

// Part 2. Printing out (Функция print)

print("Hello, Swift !")
/* public func print(_ items: Any..., separator: String = " ", terminator: String = "\n") */

// Part 3. Simple operations (Простые операции)

2 + 6 // 8
10 - 2 // 8
2 * 4 // 8
24 / 3 // 8
2+6 // 8
// 2 +6
// error: consecutive statements on a line must be separated by ';' (Последовательные операторы в строке должны быть разделены)

// Part 4. Decimal numbers (Десятичные числа)

27 / 7 // 3
22.0 / 7.0 // 3.142857142857143

// Part 5. The remainder operation (Оператор остатка)

28 % 10 // 8
(28.0).truncatingRemainder(dividingBy: 10.0) // 8
// Это вычисляет 28, деленное на 10, а затем обрезает результат, отбрасывая любые лишние десятичные дроби и возвращает оставшуюся часть. Результат такой же, как и % при отсутствии десятичных знаков.
9 % 4 // 1
9 == (4 * 2) + 1 // true
-9 % 4 // -1
// 9 = (4 * 2) + -1










