<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- BODY -->
            <div class="body">

                

                <section class="content">
                    
<ol class="breadcrumb">
    <li><a href="index.html"><i class="fa fa-home fa-fw"></i> Home</a></li>
    <li>UI Elements</li>
    <li class="active">Buttons &amp; Labels</li>
</ol>

<div class="header">
    <div class="col-md-12">
        <h3 class="header-title">UI Elements &raquo; Buttons &amp; Labels</h3>
        <p class="header-info">Common UI elements designed specifically for ArkAdmin</p>
    </div>
</div>

<!-- CONTENT -->
<div class="main-content">
    <div class="row">
        <div class="col-md-12">
            <h3>Default buttons</h3>

            <!-- Standard button -->
            <button type="button" class="btn btn-default">Default</button>

            <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
            <button type="button" class="btn btn-primary">Primary</button>

            <!-- Indicates a successful or positive action -->
            <button type="button" class="btn btn-success">Success</button>

            <!-- Contextual button for informational alert messages -->
            <button type="button" class="btn btn-info">Info</button>

            <!-- Indicates caution should be taken with this action -->
            <button type="button" class="btn btn-warning">Warning</button>

            <!-- Indicates a dangerous or potentially negative action -->
            <button type="button" class="btn btn-danger">Danger</button>

            <!-- Deemphasize a button by making it look like a link while maintaining button behavior -->
            <button type="button" class="btn btn-link">Link</button>

            <h3>Multiple Sizes</h3>
            <p>
                <button type="button" class="btn btn-default btn-lg">Large button</button>
                <button type="button" class="btn btn-primary btn-lg">Large button</button>
                <button type="button" class="btn btn-success btn-lg">Large button</button>
                <button type="button" class="btn btn-info btn-lg">Large button</button>
                <button type="button" class="btn btn-warning btn-lg">Large button</button>
                <button type="button" class="btn btn-danger btn-lg">Large button</button>
            </p>
            <p>
                <button type="button" class="btn btn-default">Default button</button>
                <button type="button" class="btn btn-primary">Default button</button>
                <button type="button" class="btn btn-success">Default button</button>
                <button type="button" class="btn btn-info">Default button</button>
                <button type="button" class="btn btn-warning">Default button</button>
                <button type="button" class="btn btn-danger">Default button</button>
            </p>
            <p>
                <button type="button" class="btn btn-default btn-sm">Small button</button>
                <button type="button" class="btn btn-primary btn-sm">Small button</button>
                <button type="button" class="btn btn-success btn-sm">Small button</button>
                <button type="button" class="btn btn-info btn-sm">Small button</button>
                <button type="button" class="btn btn-warning btn-sm">Small button</button>
                <button type="button" class="btn btn-danger btn-sm">Small button</button>
            </p>
            <p>
                <button type="button" class="btn btn-default btn-xs">Extra small button</button>
                <button type="button" class="btn btn-primary btn-xs">Extra small button</button>
                <button type="button" class="btn btn-success btn-xs">Extra small button</button>
                <button type="button" class="btn btn-info btn-xs">Extra small button</button>
                <button type="button" class="btn btn-warning btn-xs">Extra small button</button>
                <button type="button" class="btn btn-danger btn-xs">Extra small button</button>
            </p>

            <h3>Block buttons</h3>
            <div class="row">
                <div class="col-md-4">
                    <button type="button" class="btn btn-default btn-lg btn-block">Block level button</button>
                    <button type="button" class="btn btn-primary btn-lg btn-block">Block level button</button>
                </div>
            </div>

            <h3>Active State</h3>

            <button type="button" class="btn btn-primary btn-lg active">Primary button</button>
            <button type="button" class="btn btn-default btn-lg active">Button</button>

            <h3>Loading State</h3>

            <button class="btn btn-default ark-ex-loading" data-loading-text="Loading...">Load</button>
            <button class="btn btn-primary ark-ex-loading" data-loading-text="Refreshing...">Refresh</button>
            <button class="btn btn-success ark-ex-loading" data-loading-text="Saving...">Save</button>
            <button class="btn btn-warning ark-ex-loading" data-loading-text="Alerting...">Alert</button>
            <button class="btn btn-info ark-ex-loading" data-loading-text="Notifying...">Notify</button>
            <button class="btn btn-danger ark-ex-loading" data-loading-text="Removing...">Remove</button>

            <h3>Disabled State</h3>

            <button type="button" class="btn btn-default btn-lg" disabled="disabled">Button</button>
            <button type="button" class="btn btn-lg btn-primary" disabled="disabled">Primary button</button>
            <button type="button" class="btn btn-lg btn-success" disabled="disabled">Success button</button>
            <button type="button" class="btn btn-lg btn-info" disabled="disabled">Info button</button>
            <button type="button" class="btn btn-lg btn-warning" disabled="disabled">Warning button</button>
            <button type="button" class="btn btn-lg btn-danger" disabled="disabled">Danger button</button>

            <h3>Button Groups</h3>

            <p>Group related actions easily using button groups:</p>
            <div class="btn-group">
                <button type="button" class="btn btn-primary">Left</button>
                <button type="button" class="btn btn-primary">Middle</button>
                <button type="button" class="btn btn-primary">Right</button>
            </div>

            <p></p>
            <p>You can also arrange your button groups vertically:</p>

            <div class="row">
                <div class="col-md-12">
                    <div class="btn-group btn-group-vertical">
                        <button type="button" class="btn btn-primary">A</button>
                        <button type="button" class="btn btn-primary">B</button>
                        <button type="button" class="btn btn-primary">C</button>
                    </div>
                </div>
            </div>

            <p></p>
            <p>Combine button groups together into a toolbar for more complex components:</p>
            <div class="btn-toolbar" role="toolbar">
                <div class="btn-group">
                    <button type="button" class="btn btn-default"><i class="fa fa-align-left"></i></button>
                    <button type="button" class="btn btn-default active"><i class="fa fa-align-center"></i></button>
                    <button type="button" class="btn btn-default"><i class="fa fa-align-justify"></i></button>
                    <button type="button" class="btn btn-default"><i class="fa fa-align-right"></i></button>
                </div>
                <div class="btn-group">
                    <button type="button" class="btn btn-default"><i class="fa fa-cut"></i></button>
                    <button type="button" class="btn btn-default"><i class="fa fa-copy"></i></button>
                    <button type="button" class="btn btn-default"><i class="fa fa-paste"></i></button>
                </div>
                <div class="btn-group">
                    <button type="button" class="btn btn-default"><i class="fa fa-indent"></i></button>
                    <button type="button" class="btn btn-default"><i class="fa fa-outdent"></i></button>
                </div>
            </div>

            <h3>Buttons with Icons</h3>

            <button type="button" class="btn btn-primary"><i class="fa fa-plus"></i> Add</button>
            <button type="button" class="btn btn-success"><i class="fa fa-pencil"></i> Edit</button>
            <button type="button" class="btn btn-danger"><i class="fa fa-trash-o"></i> Delete</button>

            <h3>Dropdown Buttons</h3>

            <!-- Single button -->
            <div class="btn-group">
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    Action <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>

            <!-- Single button -->
            <div class="btn-group">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                    Action <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>

            <!-- Single button -->
            <div class="btn-group">
                <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
                    Action <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>

            <!-- Single button -->
            <div class="btn-group">
                <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
                    Action <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>
            <!-- Single button -->
            <div class="btn-group">
                <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
                    Action <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>
            <!-- Single button -->
            <div class="btn-group">
                <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
                    Action <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>
            <!-- Single button -->
            <div class="btn-group">
                <button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown">
                    Action <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>

            <p></p>

            <!-- Split button -->
            <div class="btn-group">
                <button type="button" class="btn btn-default"><i class="fa fa-archive"></i> Action</button>
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <span class="caret"></span>
                    <span class="sr-only">Toggle Dropdown</span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>
            <!-- Split button -->
            <div class="btn-group">
                <button type="button" class="btn btn-primary"><i class="fa fa-backward"></i> Action</button>
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                    <span class="caret"></span>
                    <span class="sr-only">Toggle Dropdown</span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>
            <!-- Split button -->
            <div class="btn-group">
                <button type="button" class="btn btn-success"><i class="fa fa-bell"></i> Action</button>
                <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
                    <span class="caret"></span>
                    <span class="sr-only">Toggle Dropdown</span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>
            <!-- Split button -->
            <div class="btn-group">
                <button type="button" class="btn btn-info"><i class="fa fa-bolt"></i> Action</button>
                <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
                    <span class="caret"></span>
                    <span class="sr-only">Toggle Dropdown</span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>
            <!-- Split button -->
            <div class="btn-group">
                <button type="button" class="btn btn-warning">Action</button>
                <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
                    <span class="caret"></span>
                    <span class="sr-only">Toggle Dropdown</span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>
            <!-- Split button -->
            <div class="btn-group">
                <button type="button" class="btn btn-danger">Action</button>
                <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
                    <span class="caret"></span>
                    <span class="sr-only">Toggle Dropdown</span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>

            <p></p>

            <!-- Split button -->
            <div class="btn-group">
                <button type="button" class="btn btn-xs btn-default">Action</button>
                <button type="button" class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown">
                    <span class="caret"></span>
                    <span class="sr-only">Toggle Dropdown</span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>
            <!-- Split button -->
            <div class="btn-group">
                <button type="button" class="btn btn-sm btn-primary">Action</button>
                <button type="button" class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown">
                    <span class="caret"></span>
                    <span class="sr-only">Toggle Dropdown</span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>

            <div class="btn-group dropup">
                <button type="button" class="btn btn-xs btn-success">Action</button>
                <button type="button" class="btn btn-xs btn-success dropdown-toggle" data-toggle="dropdown">
                    <span class="caret"></span>
                    <span class="sr-only">Toggle Dropdown</span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>
            <!-- Split button -->
            <div class="btn-group dropup">
                <button type="button" class="btn btn-sm btn-info">Action</button>
                <button type="button" class="btn btn-sm btn-info dropdown-toggle" data-toggle="dropdown">
                    <span class="caret"></span>
                    <span class="sr-only">Toggle Dropdown</span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>

            <!-- Split button -->
            <div class="btn-group">
                <button type="button" class="btn btn-lg btn-warning">Action</button>
                <button type="button" class="btn btn-lg btn-warning dropdown-toggle" data-toggle="dropdown">
                    <span class="caret"></span>
                    <span class="sr-only">Toggle Dropdown</span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>
            <!-- Split button -->
            <div class="btn-group">
                <button type="button" class="btn btn-lg btn-danger">Action</button>
                <button type="button" class="btn btn-lg btn-danger dropdown-toggle" data-toggle="dropdown">
                    <span class="caret"></span>
                    <span class="sr-only">Toggle Dropdown</span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>

            <h3>Labels</h3>

            <p>Use the <code>.label</code> class from Bootstrap to highlight statuses and any other tags or labels you might need.</p>

            <p>
                <span class="label label-default">Default</span>
                <span class="label label-primary">Primary</span>
                <span class="label label-success">Success</span>
                <span class="label label-info">Info</span>
                <span class="label label-warning">Warning</span>
                <span class="label label-danger">Danger</span>
            </p>

            <p>The ArkAdmin theme also provides you with a few additional classes to make your application look even
                more unique and showing intent using arrow heads. Check out the code bellow:</p>

            <pre class="prettyprint linenums">
&lt;span class="label label-default arrowed arrow-left"&gt;Arrow Left Out&lt;/span&gt;
&lt;span class="label label-default arrowed arrow-left-in"&gt;Arrow Left In&lt;/span&gt;
&lt;span class="label label-default arrowed arrow-right"&gt;Arrow Right Out&lt;/span&gt;
&lt;span class="label label-default arrowed arrow-right-in"&gt;Arrow Right In&lt;/span&gt;
</pre>
            <p>You can also have any combination of the above on the same label as illustrated below:</p>
            <p>
                <span class="label label-default arrowed arrow-left">Default</span>
                <span class="label label-primary arrowed arrow-left">Primary</span>
                <span class="label label-success arrowed arrow-left">Success</span>
                <span class="label label-info arrowed arrow-left">Info</span>
                <span class="label label-warning arrowed arrow-left">Warning</span>
                <span class="label label-danger arrowed arrow-left">Danger</span>
            </p>
            <p>
                <span class="label label-default arrowed arrow-left-in">Default</span>
                <span class="label label-primary arrowed arrow-left-in">Primary</span>
                <span class="label label-success arrowed arrow-left-in">Success</span>
                <span class="label label-info arrowed arrow-left-in">Info</span>
                <span class="label label-warning arrowed arrow-left-in">Warning</span>
                <span class="label label-danger arrowed arrow-left-in">Danger</span>
            </p>

            <p>
                <span class="label label-default arrowed arrow-right-in arrow-left">Default</span>
                <span class="label label-primary arrowed arrow-right arrow-left-in">Primary</span>
                <span class="label label-success arrowed arrow-right arrow-left">Success</span>
                <span class="label label-info arrowed arrow-right-in arrow-left-in">Info</span>
                <span class="label label-warning arrowed arrow-right-in">Warning</span>
                <span class="label label-danger arrowed arrow-right">Danger</span>
            </p>
            <p>You can even use them within buttons to show a counter or a small label:</p>

            <p>
                <a href="#" class="btn btn-primary btn-lg">
                    <i class="fa fa-bolt"></i>
                    Some Action
                    <span class="label label-danger arrowed arrow-left-in">34</span>
                </a>
            </p>

            <h3>Badges</h3>

            <p>Add a badge to any type of control element by simply adding this markup
                <code class="prettyprint">&lt;span class="badge"&gt;42&lt;/span&gt;</code>
                inside your element.
            </p>

            <div class="row">
                <div class="col-md-6 col-sm-8 col-xs-12">
                    <p><a href="#">Inbox <span class="badge badge-danger">42</span></a></p>

                    <ul class="nav nav-pills">
                        <li class="active"><a href="#">Home <span class="badge badge-primary">42</span></a></li>
                        <li><a href="#">Profile</a></li>
                        <li><a href="#">Messages <span class="badge badge-danger">3</span></a></li>
                    </ul>
                    <br>
                    <ul class="nav nav-pills nav-stacked">
                        <li class="active">
                            <a href="#">
                                <span class="badge badge-primary pull-right">42</span>
                                Home
                            </a>
                        </li>
                        <li><a href="#">Profile</a></li>
                        <li>
                            <a href="#">
                                <span class="badge badge-warning pull-right">3</span>
                                Messages
                            </a>
                        </li>
                    </ul>
                    <br>
                    <button class="btn btn-primary" type="button">
                        Messages <span class="badge">4</span>
                    </button>
                </div>
            </div>

            <h3>Pagination</h3>

            <p>Links are customizable for different circumstances. Use <code>.disabled</code> for unclickable links and <code>.active</code> to indicate the current page.</p>

            <ul class="pagination">
                <li><a href="#">&laquo;</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&raquo;</a></li>
            </ul><br/>

            <p>Fancy larger or smaller pagination? Add <code>.pagination-lg</code> or <code>.pagination-sm</code> for additional sizes.</p>
            <ul class="pagination pagination-lg">
                <li class="disabled"><a href="#">&laquo;</a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&raquo;</a></li>
            </ul><br/>

            <ul class="pagination">
                <li class="disabled"><a href="#">&laquo;</a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&raquo;</a></li>
            </ul><br/>

            <ul class="pagination pagination-sm">
                <li class="disabled"><a href="#">&laquo;</a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&raquo;</a></li>
            </ul>

            <p>Optionally you can also use quick previous and next links for simple pagination implementations with light markup and styles.</p>

            <div class="row">
                <ul class="pager col-md-6">
                    <li><a href="#">Previous</a></li>
                    <li><a href="#">Next</a></li>
                </ul>
            </div>

            <p>Or aligned on the sides:</p>

            <div class="row">
                <div class="col-md-6">
                    <ul class="pager">
                        <li class="previous"><a href="#">&larr; Older</a></li>
                        <li class="next"><a href="#">Newer &rarr;</a></li>
                    </ul>
                </div>
            </div>

            <p>Pager links also use the general <code>.disabled</code> utility class from the pagination.</p>

            <div class="row">
                <div class="col-md-6">
                    <ul class="pager">
                        <li class="previous disabled"><span>&larr; Older</span></li>
                        <li class="next"><a href="#">Newer &rarr;</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END: CONTENT -->
                </section>
            </div>
            <!-- END: BODY -->