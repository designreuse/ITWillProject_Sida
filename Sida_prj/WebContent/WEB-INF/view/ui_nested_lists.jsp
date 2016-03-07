<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- BODY -->
            <div class="body">


                <section class="content">
                    
<ol class="breadcrumb">
    <li><a href="index.html"><i class="fa fa-home fa-fw"></i> Home</a></li>
    <li>UI Elements</li>
    <li class="active">Nested Lists</li>
</ol>

<div class="header">
    <div class="col-md-12">
        <h3 class="header-title">UI Elements &raquo; Nested Lists</h3>
        <p class="header-info">Simple menu customization with nested lists</p>
    </div>
</div>

<!-- CONTENT -->
<div class="main-content">
    <div class="row">
        <div class="col-md-12">
            <menu id="nestable-menu">
                <button type="button" class="btn btn-primary" data-action="expand-all">Expand All</button>
                <button type="button" class="btn btn-primary" data-action="collapse-all">Collapse All</button>
            </menu>
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="dd nestable" id="nestable">
                        <ol class="dd-list">
                            <li class="dd-item" data-id="1">
                                <div class="dd-handle">Item 1</div>
                            </li>
                            <li class="dd-item" data-id="2">
                                <div class="dd-handle">Item 2 <span class="label label-danger pull-right">Alert</span></div>
                                <ol class="dd-list">
                                    <li class="dd-item" data-id="3"><div class="dd-handle">Item 3</div></li>
                                    <li class="dd-item" data-id="4"><div class="dd-handle">Item 4</div></li>
                                    <li class="dd-item" data-id="5">
                                        <div class="dd-handle">Item 5</div>
                                        <ol class="dd-list">
                                            <li class="dd-item" data-id="6"><div class="dd-handle">Item 6 <span class="label label-primary arrowed arrow-left-in pull-right">30</span></div></li>
                                            <li class="dd-item" data-id="7"><div class="dd-handle">Item 7</div></li>
                                            <li class="dd-item" data-id="8"><div class="dd-handle">Item 8</div></li>
                                        </ol>
                                    </li>
                                    <li class="dd-item" data-id="9"><div class="dd-handle">Item 9 <span class="badge badge-warning pull-right">12</span></div></li>
                                    <li class="dd-item" data-id="10"><div class="dd-handle">Item 10</div></li>
                                </ol>
                            </li>
                            <li class="dd-item" data-id="11">
                                <div class="dd-handle">Item 11</div>
                            </li>
                            <li class="dd-item" data-id="12">
                                <div class="dd-handle">Item 12</div>
                            </li>
                        </ol>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="dd nestable" id="nestable2">
                        <ol class="dd-list">
                            <li class="dd-item" data-id="13">
                                <div class="dd-handle">Item 13</div>
                            </li>
                            <li class="dd-item" data-id="14">
                                <div class="dd-handle">Item 14<span class="label label-primary arrowed arrow-left-in pull-right">7</span></div>
                            </li>
                            <li class="dd-item" data-id="15">
                                <div class="dd-handle">Item 15</div>
                                <ol class="dd-list">
                                    <li class="dd-item" data-id="16"><div class="dd-handle">Item 16</div></li>
                                    <li class="dd-item" data-id="17"><div class="dd-handle">Item 17</div></li>
                                    <li class="dd-item" data-id="18"><div class="dd-handle">Item 18</div></li>
                                </ol>
                            </li>
                        </ol>
                    </div>
                </div>
            </div>

            <h3>Serialised output for each list</h3>
            <textarea id="nestable-output"></textarea>
            <textarea id="nestable2-output"></textarea>
        </div>
    </div>
</div>
<!-- END: CONTENT -->
                </section>
            </div>
            <!-- END: BODY -->