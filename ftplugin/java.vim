set makeprg=java
set smartindent
nnoremap <buffer> <F8> :make -ea %<CR>

func Eatchar(pat)
   let c = nr2char(getchar(0))
   return (c =~ a:pat) ? '' : c
endfunc

"iabbr <silent> map map(it -> )<left><C-R>=Eatchar('\s')<CR>
"iabbr <silent> filter filter(it ->)<left><C-R>=Eatchar('\s')<CR>
"iabbr <silent> collect collect()<left><C-R>=Eatchar('\s')<CR>
"iabbr <silent> groupby Collectors.groupingBy()<left><C-R>=Eatchar('\s')<CR>
"iabbr <silent> partitionby Collectors.partitionBy()<left><C-R>=Eatchar('\s')<CR>
"iabbr <silent> joining Collectors.joining<left><C-R>=Eatchar('\s')<CR>
"iabbr <silent> sum Collectors.summingInt()<left><C-R>=Eatchar('\s')<CR>
"iabbr <silent> toMap Collectors.toMap()<left><C-R>=Eatchar('\s')<CR>
"iabbr <silent> tomap Collectors.toMap()<left><C-R>=Eatchar('\s')<CR>
"iabbr <silent> toSet Collectors.toSet()<left><C-R>=Eatchar('\s')<CR>
"iabbr <silent> toset Collectors.toSet()<left><C-R>=Eatchar('\s')<CR>
"iabbr <silent> toList Collectors.toList()<left><C-R>=Eatchar('\s')<CR>
"iabbr <silent> tolist Collectors.toList()<left><C-R>=Eatchar('\s')<CR>
"
"iabbr <silent> opt Optional<C-R>=Eatchar('\s')<CR>
"iabbr <silent> opti Optional<Integer><C-R>=Eatchar('\s')<CR>
"iabbr <silent> opte Optional.empty()<left><C-R>=Eatchar('\s')<CR>
"iabbr <silent> opto Optional.of()<left><C-R>=Eatchar('\s')<CR>
"iabbr <silent> bool boolean
"iabbr <silent> Bool Boolean
"iabbr <silent> sz size()<C-R>=Eatchar('\s')<CR> 
"iabbr <silent> len length<C-R>=Eatchar('\s')<CR>
"iabbr <silent> pubstat public static

iabbr <silent> sout System.out.println(mi);
    \`i<right><C-R>=Eatchar('\s')<CR>

iabbr <silent> fore for (var mi) {
    \}
    \`i<right><C-R>=Eatchar('\s')<CR>
iabbr <silent> fori for (int i = 0; i < mi; i++) {
    \}
    \`i<right><C-R>=Eatchar('\s')<CR>
iabbr <silent> forj for (int j = 0; j < mi; i++) {
    \}
    \`i<right><C-R>=Eatchar('\s')<CR>
iabbr <silent> while while (mi) {
    \}
    \`i<right><C-R>=Eatchar('\s')<CR>

iabbr <silent> if( if (mi) {
    \}
    \`i<right><C-R>=Eatchar('\s')<CR>
iabbr <silent> elseif else if (mi) {
    \}
    \`i<right><C-R>=Eatchar('\s')<CR>
iabbr <silent> else else {mi
    \}
    \`i<right><C-R>=Eatchar('\s')<CR>

iabbr <silent> main public static void main(String[] args) {
    \   System.out.println("hello world");
    \}
    \<C-R>=Eatchar('\s')<CR>

iabbr <silent> importa import java.util.Optional;
    \import java.util.stream.Stream;
    \import java.util.Comparator;
    \import java.util.regex.Pattern;
    \import java.util.regex.MatchResult;
    \import java.util.regex.Matcher;
    \import java.util.ArrayList; 
    \import java.util.PriorityQueue;
    \import java.lang.StringBuilder;
    \import java.util.Arrays; 
    \import java.util.Map;
    \import java.util.HashMap;
    \import java.util.stream.Collectors;
    \<C-R>=Eatchar('\s')<CR>

"    public static Optional<Integer> bsearch (int[] arr, int target) {
"        return bsearch(arr, target, 0, arr.length-1);
"    }
"
"    public static Optional<Integer> bsearch (int[] arr, int target, int start) {
"        return bsearch (arr, target, start, arr.length-1);
"    }
"
"    public static Optional<Integer> bsearch (int[] arr, int target, int start, int end) {
"        int l = start;
"        int r = end;
"        while (l <= r) {
"            int m = (l + r) >>> 1;
"            if (arr[m] < target) {
"                l = m + 1;
"            } else if (arr[m] > target) {
"                r = m - 1;
"            } else {
"                return Optional.of(m);
"            }
"        }
"        return Optional.empty();
"    }
"
"
"    public static Optional<Integer> bsearchLargerThan (int[] arr, int target, int start, int end) {
"        int l = start;
"        int r = end;
"        Optional<Integer> res = Optional.empty();
"        while (l <= r) {
"            int m = (l + r) >>> 1;
"            if (arr[m] < target) {
"                l = m + 1;
"            } else if (arr[m] > target) {
"                r = m - 1;
"                res = Optional.of(m);
"            } else {
"                return Optional.of(m);
"            }
"        }
"        return res;
"    }
"
"    public static int bsearch_right (int[] arr, int target) {
"        int l = 0;
"        int r = arr.length;
"        while (l < r) {
"            int m = (l + r) >>> 1;
"            if (arr[m] > target) {
"                r = m; 
"            } else {
"                l = m + 1;
"            }
"        }
"        return r - 1;
"    }
"
"    public static Optional<Integer> successor (int[] arr, int target) {
"        return Optional.of(bsearch_right(arr, target)).map(it -> it + 1).filter(it -> it < arr.length);
"    }
"
"    public static int bsearch_left (int[] arr, int target) {
"        int l = 0;
"        int r = arr.length;
"        while (l < r) {
"            int m = (l + r) >>> 1;
"            if (arr[m] < target) {
"                l = m + 1; 
"            } else {
"                r = m;
"            }
"        }
"        return r;
"    }
"    
"    public static int rank (int[] arr, int target) {
"        return bsearch_left(arr, target);    
"    }
"
"    public static Optional<Integer> predecessor (int[] arr, int target) {
"        return Optional.of(rank(arr, target)).map(rnk -> rnk - 1).filter(pred -> pred >= 0);
"    }
