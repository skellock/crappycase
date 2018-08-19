from sequtils import mapIt
from strutils import
    isDigit, isAlphaNumeric, toUpperAscii, isUpperAscii,
    join, toLowerAscii, isLowerAscii


proc toUpperFirstLetter(value: string): string =
    ## Makes the first letter of a string uppercase.
    if value.len == 0:
        result = value
    else:
        result = value[0].toUpperAscii() & value[1..high(value)]


proc splitCase*(value: string): seq[string] =
    ## Splits a string on word, whitespace, or identifier tokens.
    ##
    ## It will drop the non-ascii characters along the way, so this is really
    ## only good for things like filenames and variable names.
    runnableExamples:
        doAssert splitCase("helloWorld") == @["hello", "World"]
        doAssert splitCase("i am groot") == @["i", "am", "groot"]

    result = @[]

    var
        currentWord = ""
        isRunOfCaps = false

    for chr in value.items:
        var isBoundary = false

        if chr.isUpperAscii:
            isBoundary = not isRunOfCaps and currentWord.len > 0
        else:
            isBoundary = not chr.isLowerAscii and not chr.isDigit

        if isBoundary:
            if currentWord.len > 0:
                result.add currentWord
                currentWord = ""
                if chr.isAlphaNumeric:
                    currentWord &= chr
            else:
                currentWord = ""
        else:
            currentWord &= chr

        isRunOfCaps = chr.isUpperAscii

    if currentWord.len > 0:
        result.add currentWord


proc kebab*(value: string): string =
    ## Converts a string into a kebab case.
    runnableExamples:
        doAssert kebab("helloWorld") == "hello-world"
        doAssert kebab("i am groot") == "i-am-groot"

    result = value
        .splitCase
        .mapIt(it.toLowerAscii)
        .join("-")


proc snake*(value: string): string =
    ## Converts a string into lower snake case.
    runnableExamples:
        doAssert snake("helloWorld") == "hello_world"
        doAssert snake("i am groot") == "i_am_groot"

    result = value
        .splitCase
        .mapIt(it.toLowerAscii)
        .join("_")


proc screamingSnake*(value: string): string =
    ## Converts a string into upper snake case.
    runnableExamples:
        doAssert screamingSnake("helloWorld") == "HELLO_WORLD"
        doAssert screamingSnake("i am groot") == "I_AM_GROOT"

    result = value.snake.toUpperAscii


proc pascal*(value: string): string =
    ## Converts a string into pascal case.
    runnableExamples:
        doAssert pascal("helloWorld") == "HelloWorld"
        doAssert pascal("i am groot") == "IAmGroot"

    result = value
        .splitCase
        .mapIt(it.toLowerAscii)
        .mapIt(it.toUpperFirstLetter)
        .join ""


proc camel*(value: string): string =
    ## Converts a string into camel case.
    runnableExamples:
        doAssert camel("helloWorld") == "helloWorld"
        doAssert camel("i am groot") == "iAmGroot"

    result = ""
    let words = splitCase value
    for i in 0..high(words):
        var word = words[i].toLowerAscii
        if i > 0:
            word = word.toUpperFirstLetter
        result &= word
