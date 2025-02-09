<?php

class Pagination {
    function __construct(public int $amount, public int $recordsPerPage) {
    }

    function prepare() {
        $currIndex = 0;

        $indexes = [$currIndex];

        while ($currIndex + $this->recordsPerPage < $this->amount) {
            $currIndex += $this->recordsPerPage;
            $indexes[] = $currIndex;
        }

        return $indexes;
    }
}

$pagination = new Pagination(9,  8);
$pagination1 = new Pagination(40, 10);
$pagination2 = new Pagination(10, 3);

echo '[';
echo implode(", ", $pagination->prepare());
echo '] [';
echo implode(", ", $pagination1->prepare());
echo '] [';
echo implode(", ", $pagination2->prepare());
echo ']';